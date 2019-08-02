package com.yc.olshop.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.olshop.bean.Comment;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.CommentBiz;
import com.yc.olshop.biz.OrderBiz;
import com.yc.olshop.utils.Result;

@Controller
@RequestMapping("comment")
public class CommentController {

	@Autowired
	private CommentBiz cb;
	@Autowired
	OrderBiz orderBiz;

	// 用户提交评论
	@ResponseBody
	@PostMapping("userSubmitComment")
	public Result userSubmitComment(@RequestParam("commContent") String content, String orderId,
			@RequestParam(required = true) int stars, HttpSession session) {
		User user = (User) session.getAttribute("user");
		try {
			cb.userSubmitComment(content, orderId, stars, user.getUid());
			// 修改订单状态
			orderBiz.changStatusForOrderWithComment(orderId);
			return new Result(1, "提交成功！");
		} catch (Exception e) {
			return new Result(0, "提交失败！");
		}
	}

	// 添加点赞
	@RequestMapping("addLikeComment")
	@ResponseBody
	public Result addLikeComment(Integer commId, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int code = cb.addLikeComment(commId, user.getUid());
		List<Integer> data = cb.selectLike(commId);
		if (code == 1) {
			return new Result(1, "添加成功", data);
		} else {
			return new Result(0, "添加失败", data);
		}
	}

	// 删除点赞
	@RequestMapping("delLikeComment")
	@ResponseBody
	public Result delLikeComment(Integer commId, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int code = cb.delLikeComment(commId, user.getUid());
		List<Integer> data = cb.selectLike(commId);
		if (code == 1) {
			return new Result(1, "删除成功", data);
		} else {
			return new Result(0, "删除失败", data);
		}
	}

	// 查询点赞
	@RequestMapping("selectLike")
	@ResponseBody
	public Result selectLike(Integer commId) {
		List<Integer> data = cb.selectLike(commId);
		if (data != null && data.size() > 0) {
			return new Result(1, "查询成功", data);

		} else {
			return new Result(0, "此商品暂无点赞记录", data);
		}
	}

	@RequestMapping("selectAllComment")
	@ResponseBody
	public Result selectAllComment(Integer pid) {
		List<Comment> data = cb.selectAllComment(pid);
		if (data != null && data.size() > 0) {
			return new Result(1, "查询成功", data);

		} else {
			return new Result(0, "此商品暂无评价记录", data);
		}
	}

}
