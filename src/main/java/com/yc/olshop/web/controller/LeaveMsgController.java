package com.yc.olshop.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yc.olshop.bean.Leavemsg;
import com.yc.olshop.bean.Result;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.BizException;
import com.yc.olshop.biz.LeaveMsgBiz;

@RestController
@RequestMapping("leave")
public class LeaveMsgController {
	@Autowired
	private LeaveMsgBiz lmbiz;

	// 查询所有 留言列表
	@RequestMapping("queryAllLeaveMsgList")
	public Map<String, Object> queryAllLeaveMsgList(@RequestParam(defaultValue = "-1") Integer fcode,
			@RequestParam(required = false) String key) {
		List<Leavemsg> lmList = lmbiz.queryAllLeaveMsgList(fcode, key);
		Map<String, Object> map = new HashMap<>();
		map.put("data", lmList);
		return map;
	}

	// 标记 已浏览
	@PostMapping("markAsViewed")
	public Result markAsViewed(Integer lmId) {
		Result result = new Result(1, "ok");
		int ret = lmbiz.markAsViewed(lmId);
		if (ret <= 0) {
			result = new Result(-1, "服务器忙");
		}
		return result;
	}

	// 标记 已浏览
	@PostMapping("replyByEmail")
	public Result replyByEmail(Leavemsg lmsg) {
		Result result = new Result(1, "ok");
		try {
			int ret = lmbiz.replyByEmail(lmsg);
			if (ret <= 0) {
				result = new Result(-1, "服务器忙");
			}
		} catch (BizException e) {
			e.printStackTrace();
			result = new Result(0, e.getMessage());
		}
		return result;
	}

	@PostMapping("checkIsReplied")
	public Result checkIsReplied(Integer lmId) {
		Result result = new Result(1, "ok");
		boolean ret = lmbiz.checkIsReplied(lmId);
		if (ret) {
			// 已回复，则在获取 回复内容
			String reply = lmbiz.getReplyContentByLmid(lmId);
			result.setCode(0);
			result.setData(reply);
		}
		return result;
	}

	// 删除 留言
	@PostMapping("delByLmid")
	public Result delByLmid(Integer lmId) {
		Result result = new Result(1, "ok");
		int ret = lmbiz.delByLmid(lmId);
		if (ret <= 0) {
			// s失败
			result = new Result(-1, "服务器忙");
		}
		return result;
	}

	@PostMapping("sendMessage")
	public Result sendMessage(String message, HttpSession session) {
		Result result = new Result(1, "ok");
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return result = new Result(0, "您还未登录，请先登录");
		}
		int ret;
		try {
			ret = lmbiz.addMessageByUser(message, user.getUid());
			if (ret <= 0) {
				// s失败
				result = new Result(-1, "服务器忙");
			}
		} catch (BizException e) {
			e.printStackTrace();
			result = new Result(0, e.getMessage());
		}

		return result;
	}

}
