package com.yc.olshop.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.yc.olshop.bean.Result;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.BizException;
import com.yc.olshop.biz.UserBiz;
import com.yc.olshop.utils.MyUtil;
import com.yc.olshop.utils.StringUtil;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserBiz ubiz;

	// 日期字符串格式化
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false)); // true:允许输入空值，false:不能为空值

	}

	@GetMapping("logout")
	@ResponseBody
	public Result logout(HttpSession session, HttpServletResponse response) {
		Result result = new Result(1, "ok");
		session.removeAttribute("user");
		session.invalidate();
		return result;
	}

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @param errors
	 * @return
	 */
	@PostMapping(value = "register")
	@ResponseBody
	public Result register(@Valid User user, Errors errors, String inputPCode, HttpServletRequest req) {
		Result result = new Result(Result.REG_SUCCESS, "注册成功！");
		if (errors.hasErrors()) {
			// 失败验证，把错误信息带回前台
			result = new Result(Result.VERIFY_FAILED, "验证失败", errors.getAllErrors());
			return result;
		} else {
			// 验证通过
			try {
				// 从cookie获取验证码
				Cookie[] cookies = req.getCookies();
				String phoneCode = MyUtil.getCookieValue(cookies, user.getPhone());
				// System.out.println("====" + inputPCode + "---" + phoneCode);
				int ret = ubiz.registerUser(user, inputPCode, phoneCode);
				// int ret = 0;
				if (ret <= 0) {
					result.setCode(-1);
					result.setMsg("注册失败！");
				}
				return result;
			} catch (BizException e) {
				e.printStackTrace();
				return new Result(-1, e.getMessage());
			}
		}
	}

	/**
	 * 用户登录
	 * 
	 * @param user
	 * @return
	 */
	@PostMapping(value = "login")
	@ResponseBody
	public Result login(User user, String code, HttpSession session) {
		Result result = new Result(1, "登录成功");
		// 1.获取真实验证码
		String realcode = (String) session.getAttribute("code");
		User u = null;
		try {

			u = ubiz.loginUser(user, code, realcode);
			// 判断是否 重复登录
			if (session.getAttribute("user") != null) {
				return new Result(0, "请勿重复登录");
			} else {
				if (u == null) {
					// 登录失败，
					result = new Result(-1, "用户名或密码错误");
					return result;
				}
				// 登录成功，跳转到首页
				session.setAttribute("user", u);
				return result;
			}

		} catch (BizException e) {
			e.printStackTrace();
			return new Result(0, e.getMessage());

		}

	}

	@PostMapping(value = "sendSms")
	@ResponseBody
	public Result sendSms(String phone, HttpServletResponse resp) {

		try {
			// 1.生成验证码
			int phoneCode = MyUtil.getRandomCode();
			// 2.发送验证码
			MyUtil.sendMessage(phone, phoneCode);
			// 3.将 手机号-验证码 存到cookie中，设置 失效时间为60秒
			Cookie c = new Cookie(phone, phoneCode + "");
			c.setMaxAge(60000);
			resp.addCookie(c);
			return new Result(1, "发送成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(0, "服务器忙");
		}
	}

	/**
	 * ajax 异步校验 用户名
	 * 
	 * @param username
	 * @return
	 */
	@PostMapping(value = "checkUserName")
	@ResponseBody
	public Map<String, Object> checkUserName(String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		User u = ubiz.findUserByUserName(username);
		if (u == null) {
			// 用户名可用
			map.put("valid", true);
		} else {
			// 用户名已存在
			map.put("valid", false);
		}
		return map;
	}

	/**
	 * ajax 异步校验 手机号
	 * 
	 * @param username
	 * @return
	 */
	@PostMapping(value = "checkPhone")
	@ResponseBody
	public Map<String, Object> checkPhone(String phone, @RequestParam(required = false) String mphone,
			@RequestParam(defaultValue = "forReg") String flag) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (StringUtil.isEmpty(phone) || phone.length() != 11) {
			phone = mphone;
		}
		User u = ubiz.findUserByPhone(phone);
		if (u == null) {
			// 手机可用
			if (flag.equals("forget")) {
				map.put("valid", false);
			} else
				map.put("valid", true);
		} else {
			// 手机号已被注处
			if (flag.equals("forget")) {// 如果是 忘记密码 ，则刚好相反，手机号需要已注册的
				map.put("valid", true);
			} else
				map.put("valid", false);
		}
		return map;
	}

	/**
	 * 忘记密码--通过手机验证码找回
	 * 
	 * @param mphone
	 *            手机号
	 * @param mcode
	 *            输入的验证码
	 * @param mnewpwd
	 *            新密码
	 * @param mrepwd
	 *            确面膜
	 * @param req
	 * @return
	 */
	@PostMapping(value = "forgetPwd")
	@ResponseBody
	public Result forgetPwd(String mphone, String mcode, String mnewpwd, String mrepwd, HttpServletRequest req) {
		try {
			Result result = new Result(1, "修改成功");
			// 从cookie获取 短信验证码
			Cookie[] cookies = req.getCookies();
			String phoneCode = MyUtil.getCookieValue(cookies, mphone);
			int ret = ubiz.updateByPhone(mphone, phoneCode, mcode, mnewpwd, mrepwd);
			if (ret <= 0) {
				result = new Result(-1, "修改失败");
			}
			return result;
		} catch (BizException e) {
			e.printStackTrace();
			return new Result(-1, e.getMessage());
		}
	}

	@PostMapping(value = "loginByMsg")
	@ResponseBody
	public Result loginByMsg(String phone, String code, HttpServletRequest req) {

		try {
			Result result = new Result(1, "登录成功");
			// 从cookie获取 短信验证码
			Cookie[] cookies = req.getCookies();
			String phoneCode = MyUtil.getCookieValue(cookies, phone);
			User u = ubiz.loginByPhone(phone, code, phoneCode);
			if (u == null) {
				result = new Result(-1, "登录失败");
				return result;
			}
			// 登录成功，将user存到 session
			req.getSession().setAttribute("user", u);
			return result;
		} catch (BizException e) {
			e.printStackTrace();
			return new Result(0, e.getMessage());
		}
	}

	/**
	 * 获取用户信息
	 * 
	 * @param user
	 * @return
	 */
	@GetMapping("getUserInfo")
	@ResponseBody
	public Result getUserInfo(@SessionAttribute("user") User user) {
		Result result = new Result(1, "ok");
		User u = ubiz.getUserInfoByUid(user.getUid());
		if (u == null) {
			result = new Result(0, "服务器忙");
		} else
			result.setData(u);
		return result;
	}

	@PostMapping("updateUserInfo")
	@ResponseBody
	public Result updateUserInfo(User user, HttpSession session) {
		Result result = new Result(1, "ok");
		User u = (User) session.getAttribute("user");
		// 修改用户信息
		user.setUid(u.getUid());
		int ret = ubiz.updateUserInfoByUid(user);
		if (ret <= 0) {
			result = new Result(-1, "服务器忙");
		}
		return result;
	}

	/**
	 * 修改密码
	 */
	@PostMapping("updatePwd")
	@ResponseBody
	public Result updatePwd(@SessionAttribute("user") User user, String oldpwd, String newpwd, String repwd) {
		Result result = new Result(1, "ok");
		try {
			int ret = ubiz.updatePwdByUid(user.getUid(), oldpwd, newpwd, repwd);
			if (ret <= 0) {
				result = new Result(-1, "服务器忙");
			}
		} catch (BizException e) {
			e.printStackTrace();
			result = new Result(0, e.getMessage());
		}
		return result;
	}

	/**
	 * 修改密码
	 */
	@PostMapping("updatePhone")
	@ResponseBody
	public Result updatePhone(@SessionAttribute("user") User user, String phone, String newPhone, String msgCode,
			HttpServletRequest req) {
		Result result = new Result(1, "ok");
		// 获取短信验证码
		Cookie[] cookies = req.getCookies();
		String phoneCode = MyUtil.getCookieValue(cookies, phone);

		try {
			int ret = ubiz.updatePhone(phone, newPhone, phoneCode, msgCode, user.getUid());
			if (ret <= 0) {
				result = new Result(-1, "服务器忙");
			}
		} catch (BizException e) {
			e.printStackTrace();
			result = new Result(0, e.getMessage());
		}
		return result;
	}

	// 根据 uid 判断该用户是否绑定 邮箱
	@GetMapping(value = "checkEmialIsExistByUid")
	@ResponseBody
	public Result checkEmialIsExistByUid(@SessionAttribute("user") User user) {
		Result result = new Result(1, "ok");
		try {
			boolean ret = ubiz.checkEmialIsExistByUid(user);
			result.setData(ret);
		} catch (BizException e) {
			e.printStackTrace();
			result = new Result(0, e.getMessage());
		}
		return result;
	}
}
