package com.yc.olshop.biz;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.yc.olshop.bean.Result;
import com.yc.olshop.bean.User;
import com.yc.olshop.bean.UserExample;
import com.yc.olshop.dao.UserMapper;
import com.yc.olshop.utils.StringUtil;

@Service
public class UserBiz {
	@Autowired
	private UserMapper um;

	// 用户注册
	public int registerUser(User user, String inputPCode, String phoneCode) throws BizException {
		if (StringUtil.isEmpty(phoneCode)) {
			// 请先获取验证码
			throw new BizException("请先获取验证码");
		}
		if (StringUtil.isEmpty(inputPCode)) {
			// 手机验证码不能为空
			throw new BizException("输入的短信验证码不能为空");
		}
		if (!phoneCode.equals(inputPCode)) {
			// 手机验证码错误
			throw new BizException("短信验证码输入错误");
		}
		if (!user.getPassword().equals(user.getRepassword())) {
			throw new BizException("两次密码不一致！");
		}
		user.setRegtime(new Date());
		user.setSex("男");
		user.setScores(0);
		user.setState(1);
		user.setPassword(StringUtil.getMD5Str(user.getPassword()));// md5加密
		user.setLevel("普通会员");
		return um.insertSelective(user);
	}

	// 用户登录
	public User loginUser(User user, String code, String realcode) throws BizException {

		if (StringUtil.isEmpty(code)) {// 验证码为空
			throw new BizException("验证码不能为空");
		}
		if (!realcode.equals(code)) {
			throw new BizException("验证码错误");
		}

		UserExample ue = new UserExample();
		ue.createCriteria().andUsernameEqualTo(user.getUsername())
				.andPasswordEqualTo(StringUtil.getMD5Str(user.getPassword()));// md5加密
		List<User> ulist = um.selectByExample(ue);

		if (ulist == null || ulist.size() <= 0) {
			return null;
		}
		// 判断是否 被管理员停用
		if (ulist.get(0).getState() == 0) {
			throw new BizException("您的账号已被停用，请联系管理员");
		}
		return ulist.get(0);
	}

	// ajax异步 检测用户名是否可用
	public User findUserByUserName(String username) {
		UserExample ue = new UserExample();
		ue.createCriteria().andUsernameEqualTo(username);
		List<User> ulist = um.selectByExample(ue);
		if (ulist == null || ulist.size() <= 0) {
			return null;
		}
		return ulist.get(0);
	}

	// ajax异步 检测 手机号 是否可用
	public User findUserByPhone(String phone) {
		UserExample ue = new UserExample();
		ue.createCriteria().andPhoneEqualTo(phone);
		List<User> ulist = um.selectByExample(ue);
		if (ulist == null || ulist.size() <= 0) {
			return null;
		}
		return ulist.get(0);
	}

	// 根据 手机 修改 用户密码
	public int updateByPhone(String mphone, String phoneCode, String mcode, String mnewpwd, String mrepwd)
			throws BizException {
		if (StringUtil.isEmpty(phoneCode)) {
			throw new BizException("请先获取验证码");
		}
		if (StringUtil.isEmpty(mcode)) {
			throw new BizException("请先输入验证码");
		}
		if (!phoneCode.equals(mcode)) {
			throw new BizException("验证码错误");
		}
		if (!mnewpwd.equals(mrepwd)) {
			throw new BizException("两次密码不一致");
		}
		UserExample ue = new UserExample();
		ue.createCriteria().andPhoneEqualTo(mphone);

		User u = new User();
		u.setPhone(mphone);
		u.setPassword(StringUtil.getMD5Str(mrepwd));

		return um.updateByExampleSelective(u, ue);
	}

	// 短信登录
	public User loginByPhone(String phone, String code, String phoneCode) throws BizException {
		if (StringUtil.isEmpty(phoneCode)) {
			throw new BizException("请先获取验证码");
		}
		if (StringUtil.isEmpty(code)) {
			throw new BizException("请先输入验证码");
		}
		if (!phoneCode.equals(code)) {
			throw new BizException("验证码错误");
		}

		UserExample ue = new UserExample();
		ue.createCriteria().andPhoneEqualTo(phone);

		// 根据手机号码 查找对应用户

		List<User> ulist = um.selectByExample(ue);
		if (ulist == null || ulist.size() <= 0) {
			return null;
		}
		return ulist.get(0);
	}

	Gson gson = new Gson();

	/**
	 * 返回Json数据
	 * 
	 * @return
	 */
	public String findAllUser() {
		List<User> list = um.selectByExample(null);
		Result result = new Result();
		result.setData(list);
		String userList = gson.toJson(result);
		return userList;
	}

	public String delUser(String[] uidGroup) {
		// 批量删除
		for (String string : uidGroup) {
			um.deleteByPrimaryKey(Integer.parseInt(string));
		}
		Result result = new Result();
		result.setMsg("删除成功！");
		String json = gson.toJson(result);
		return json;
	}

	public String changeState(int uid, int state) {
		User user = new User();
		Result result = new Result();

		user.setUid(uid);
		if (state == 1) {
			user.setState(0);
			// 返回结果设置前端的value
			result.setData(0);
		} else {
			user.setState(1);
			result.setData(1);
		}
		um.updateByPrimaryKeySelective(user);

		String json = gson.toJson(result);
		return json;
	}

	/*
	 * 根据uid删除用户
	 */
	public String delUser(int uid) {
		int flag = um.deleteByPrimaryKey(uid);
		Result result = new Result();
		if (flag == 1) {
			result.setCode(1);
			result.setMsg("删除成功！");
		} else {
			result.setCode(0);
			result.setMsg("删除失败！");
		}
		String json = gson.toJson(result);
		return json;
	}

	public String findUserByUid(int uid) {
		User user = um.selectByPrimaryKey(uid);
		String json = gson.toJson(user);
		return json;
	}

	public List<User> findAllUserLevel() {
		List<User> list = um.findAllUserLevel();
		return list;
	}

	public User findUserCount() {
		User user = um.findUserCount();
		return user;
	}

	public String showByGroup(String level) {
		List<User> list = null;
		if (level.equals("all")) {
			list = new ArrayList<>();
			// 不加条件查询
			list = um.selectByExample(null);
		} else { // 条件查询
			list = new ArrayList<>();
			list = um.findByLevel(level);
		}

		Result result = new Result();
		result.setData(list);

		String json = gson.toJson(result);
		return json;
	}

	public void insertOrUpdateUser(String user) throws IllegalAccessException, InvocationTargetException {
		User userJson = gson.fromJson(user, User.class);
		// 如果用户id没传过来，那么就是新增操作，传过来则为修改操作
		if (userJson.getUid() == null) {
			userJson.setRegtime(new Date());
			userJson.setLevel("普通会员");
			um.insertSelective(userJson);
		} else {
			um.updateByPrimaryKeySelective(userJson);
		}
	}

	// 根据 uid 获取用户信息
	public User getUserInfoByUid(Integer uid) {
		return um.selectByPrimaryKey(uid);
	}

	// 修改密码
	public int updatePwdByUid(Integer uid, String oldpwd, String newpwd, String repwd) throws BizException {
		// 根据uid 获取 旧密码
		User user = um.selectByPrimaryKey(uid);
		if (!user.getPassword().equals(StringUtil.getMD5Str(oldpwd))) {
			throw new BizException("旧密码输入错误！");
		}
		if (!newpwd.equals(repwd)) {
			throw new BizException("两次密码不一致！");
		}
		// 验证通过 ，开始修改密码
		user.setPassword(StringUtil.getMD5Str(newpwd));
		return um.updateByPrimaryKeySelective(user);
	}

	// 根据 uid修改用户信息
	public int updateUserInfoByUid(User user) {
		return um.updateByPrimaryKeySelective(user);
	}

	// 修改 用户的手机号码
	public int updatePhone(String phone, String newPhone, String phoneCode, String msgCode, Integer uid)
			throws BizException {
		if (StringUtil.isEmpty(phoneCode)) {
			throw new BizException("请先获取验证码");
		}
		if (StringUtil.isEmpty(msgCode)) {
			throw new BizException("请先输入验证码");
		}
		if (!phoneCode.equals(msgCode)) {
			throw new BizException("验证码错误");
		}
		// 根据 新手机号 查找是否已被注册
		UserExample ue = new UserExample();
		ue.createCriteria().andPhoneEqualTo(newPhone);
		List<User> list = um.selectByExample(ue);
		if (list != null && list.size() > 0) {
			// 已被注册，抛出异常
			throw new BizException("此新手机号已被注册，请更换");
		}
		// 根据 uid查找到 对应用户
		User user = um.selectByPrimaryKey(uid);
		// 将 新手机号码更新 到user里
		user.setPhone(newPhone);
		// 将user写到数据库
		return um.updateByPrimaryKeySelective(user);
	}

	// 支付时，如果选择了积分抵扣，则扣除积分
	public void modifyScores(Integer uid, int scores) {
		um.updateScoreByUid(scores, uid);
	}

	// 根据 uid 判断该用户是否绑定 邮箱
	public boolean checkEmialIsExistByUid(User user) throws BizException {
		if (user == null) {
			throw new BizException("请先登录");
		}
		User u = um.selectByPrimaryKey(user.getUid());
		if (StringUtil.isEmpty(u.getEmail())) {
			return false;
		}
		return true;
	}

	// 查找用户数量
	public User queryUserCount() {
		User user = um.findUserCount();
		return user;
	}
}
