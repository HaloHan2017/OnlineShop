package com.yc.olshop.web.controller;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.olshop.bean.Result;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.UserBiz;

@Controller
public class AdminUserController {

	@Resource
	private UserBiz userBiz;

	/*
	 * 跳转至user_list页面
	 */
	@RequestMapping("userList")
	public String userList() {
		return "admin/user/user_list";
	}

	// 跳转至等级管理
	@RequestMapping("memberGrading")
	public String memberGrading(HttpServletRequest request) {
		List<User> list = userBiz.findAllUserLevel();
		User user = userBiz.findUserCount();
		request.setAttribute("userCount", user);
		request.setAttribute("AllLevel", list);
		return "admin/user/member-Grading";
	}

	@RequestMapping("integration")
	public String integration() {
		return "admin/user/integration";
	}

	/*
	 * 搜索
	 */
	@ResponseBody
	// produces解决乱码
	@RequestMapping(value = "searchUser.do", produces = "text/json;charset=UTF-8")
	public String searchUser(User user, @RequestParam(required = false, name = "userregtime") String regtime)
			throws ParseException {
		String userList = userBiz.findAllUser();
		return userList;
	}

	/*
	 * 批量删除
	 */
	@ResponseBody
	@RequestMapping(value = "delGroup.do", produces = "text/json;charset=UTF-8")
	public String delByGroup(@RequestParam(name = "uidGroup[]") String[] uidGroup) {
		String result = userBiz.delUser(uidGroup);
		return result;
	}

	/*
	 * 修改用户状态
	 */
	@ResponseBody
	@RequestMapping(value = "changeState.do", produces = "text/json;charset=UTF-8")
	public String changeState(int uid, int state) {
		String result = userBiz.changeState(uid, state);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "delByUid.do", produces = "text/json;charset=UTF-8")
	public String delByUid(int uid) {
		String result = userBiz.delUser(uid);
		return result;
	}

	// 会员列表 修改
	@ResponseBody
	@RequestMapping(value = "editUser.do", produces = "text/json;charset=UTF-8")
	public String editUser(int uid) {
		String result = userBiz.findUserByUid(uid);
		return result;
	}

	// 等级管理 侧边栏选项
	@ResponseBody
	@RequestMapping(value = "showByGroup.do", produces = "text/json;charset=UTF-8")
	public String showByGroup(String level) {
		String result = userBiz.showByGroup(level);
		return result;
	}

	// 当管理员删除用户，侧边栏数量更新
	@ResponseBody
	@RequestMapping(value = "showAllLevel.do", produces = "text/json;charset=UTF-8")
	public String showAllLevel() {
		List<User> list = userBiz.findAllUserLevel();
		Result result = new Result();
		result.setData(list);
		Gson gson = new Gson();

		return gson.toJson(result);
	}

	// 上传头像
	@ResponseBody
	@RequestMapping("uploadHeadFile.do")
	public Result upload(@RequestParam("file") MultipartFile file) {
		try {
			file.transferTo(new File("c:/upload/head/" + file.getOriginalFilename()));
			return new Result(Result.SUCCESS, "文件上传成功！", "/upload/head/" + file.getOriginalFilename());
		} catch (Exception e) {
			return new Result(Result.FAILURE, "文件上传失败！");
		}
	}

	// 修改或者添加，前台传的json字符串，不能表单提交，只能用字符串接收，后面业务层用gson转bean
	@ResponseBody
	@RequestMapping("addOrEdit.do")
	public Result addOrEdit(@RequestParam(name = "mapJson", required = false) String user)
			throws IllegalAccessException, InvocationTargetException {
		System.out.println(user);
		try {
			userBiz.insertOrUpdateUser(user);
			return new Result(Result.SUCCESS, "成功！");
		} catch (RuntimeException e) {
			return new Result(Result.FAILURE, "失败！");
		}

	}
	@ResponseBody
	@RequestMapping("queryUserCount")
	public Result queryUserCount() {
		User user = userBiz.queryUserCount();
		Result result = new Result();
		result.setData(user.getUserCount());
		return result;
	}
}