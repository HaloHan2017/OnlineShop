package com.yc.olshop.biz;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.yc.olshop.bean.Comment;
import com.yc.olshop.bean.Orderitem;
import com.yc.olshop.bean.OrderitemExample;
import com.yc.olshop.dao.CommentMapper;
import com.yc.olshop.dao.OrderitemMapper;
import com.yc.olshop.utils.SensitiveWordsUtils;

@Service
public class CommentBiz {

	@Autowired
	private CommentMapper cm;

	@Autowired
	private RedisTemplate rt;
	@Autowired
	private OrderitemMapper oim;

	public void userSubmitComment(String content, String orderId, int stars, int uid) {
		SensitiveWordsUtils word = new SensitiveWordsUtils();
		content = word.filterSensitiveWords(content);

		// 先查询pid
		OrderitemExample oe = new OrderitemExample();
		oe.createCriteria().andOidEqualTo(orderId);
		List<Orderitem> list = oim.selectByExample(oe);
		for (Orderitem orderitem : list) {
			Integer pid = orderitem.getPid();
			Comment comment = new Comment();
			comment.setPid(pid);
			comment.setCommContent(content);
			comment.setCommStars(stars);
			comment.setUid(uid);
			comment.setCommTime(new Date());
			cm.insertSelective(comment);
		}
	}

	// 添加点赞
	public int addLikeComment(Integer commId, Integer uid) {
		try {
			List<Integer> commentList = (List<Integer>) rt.opsForValue().get("like" + commId + "");
			if (commentList == null) {
				commentList = new ArrayList<>();
				commentList.add(uid);
			} else {
				commentList.add(uid);
			}
			rt.opsForValue().set("like" + commId + "", commentList);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	// 删除点赞
	public int delLikeComment(Integer commId, Integer uid) {
		try {
			List<Integer> commentList = (List<Integer>) rt.opsForValue().get("like" + commId + "");
			for (int i = 0; i < commentList.size(); i++) {
				if (uid == commentList.get(i)) {
					commentList.remove(i);
					break;
				}
			}
			rt.opsForValue().set("like" + commId + "", commentList);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	@SuppressWarnings("unchecked")
	// 查找点赞记录
	public List<Integer> selectLike(Integer commId) {
		List<Integer> list = (List<Integer>) rt.opsForValue().get("like" + commId + "");
		if (list == null) {
			list = new ArrayList<>();
			rt.opsForValue().set("like" + commId, list);
		}
		return list;
	}

	// 查询所有评论
	public List<Comment> selectAllComment(Integer pid) {

		return cm.selectAllComment(pid);
	}

	// 查询评论条数
	public int selectcountcomm() {
		return cm.selectcountcomm();
	}

}
