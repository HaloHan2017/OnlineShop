package com.yc.olshop.biz;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.olshop.bean.Leavemsg;
import com.yc.olshop.bean.LeavemsgExample;
import com.yc.olshop.bean.MyConstants;
import com.yc.olshop.bean.User;
import com.yc.olshop.bean.UserExample;
import com.yc.olshop.dao.LeavemsgMapper;
import com.yc.olshop.dao.UserMapper;
import com.yc.olshop.utils.HtmlUtil;
import com.yc.olshop.utils.MimeMailHelper;
import com.yc.olshop.utils.StringUtil;
import com.yc.olshop.utils.TimeUtil;

@Service
public class LeaveMsgBiz {
	@Autowired
	private LeavemsgMapper lm;
	@Autowired
	private UserMapper um;
	@Autowired
	private MimeMailHelper mmHelper;

	// 查询 所有 留言反馈列表
	public List<Leavemsg> queryAllLeaveMsgList(Integer fcode, String key) {
		List<Leavemsg> list = null;
		LeavemsgExample le = new LeavemsgExample();
		if (!StringUtil.isEmpty(key)) {
			le.createCriteria().andLmContentLike("%" + key + "%");
		}
		if (fcode != -1) {
			// 按 state 码查询
			le.createCriteria().andStateEqualTo(fcode);
		} else {
			// 查询全部
		}
		list = lm.selectByExample(le);
		// 关联 user
		for (Leavemsg lm : list) {
			UserExample ue = new UserExample();
			User user = um.selectByPrimaryKey(lm.getUid());
			lm.setUser(user);
		}
		return list;
	}

	//// 标记 已浏览
	public int markAsViewed(Integer lmId) {
		Leavemsg lmsg = new Leavemsg();
		lmsg.setState(MyConstants.VIEWED_MSG);
		lmsg.setLmId(lmId);

		return lm.updateByPrimaryKeySelective(lmsg);
	}

	// 邮箱回复回复
	public int replyByEmail(Leavemsg lmsg) throws BizException {
		User user = um.selectByPrimaryKey(lmsg.getUid());
		if (StringUtil.isEmpty(user.getEmail())) {
			throw new BizException("该用户还未绑定邮箱");
		}
		// 判断是否已回复
		boolean flag = checkIsReplied(lmsg.getLmId());
		if (flag) {// 已回复，则抛异常
			throw new BizException("该留言已经回复，请勿重复操作");
		}
		// 将 回复的内容 发送到 用户的邮箱
		int ret = 0;
		try {
			ret = mmHelper.sendEmail(user.getEmail(), "OL网上商城--意见反馈回访",
					"    尊敬的" + user.getName() + "您好," + lmsg.getLmReply());
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		if (ret <= 0) {
			throw new BizException("服务器忙");
		} else {
			// 发送成功，将 数据库里的 状态改变，并将 回复内容写入
			lmsg.setState(MyConstants.REPLYED_MSG);
			return lm.updateByPrimaryKeySelective(lmsg);
		}
	}

	// 根据 lmId判断 留言是否被回复
	public boolean checkIsReplied(Integer lmId) {
		Leavemsg leavemsg = lm.selectByPrimaryKey(lmId);
		if (StringUtil.isEmpty(leavemsg.getLmReply())) {
			// 未回复
			return false;
		} else {
			// 已回复
			return true;
		}
	}

	// 已回复，则在获取 回复内容
	public String getReplyContentByLmid(Integer lmId) {
		Leavemsg leavemsg = lm.selectByPrimaryKey(lmId);
		return leavemsg.getLmReply();
	}

	// 根据 lmid 删除留言
	public int delByLmid(Integer lmId) {
		return lm.deleteByPrimaryKey(lmId);
	}

	public int addMessageByUser(String message, Integer uid) throws BizException {
		// 统计 该uid的 对应的用户 今日留言是否 超过 5次
		LeavemsgExample le = new LeavemsgExample();
		le.createCriteria().andUidEqualTo(uid);
		int userLeaveCnt = lm.countByExample(le);
		if (userLeaveCnt > 5) {
			throw new BizException("对不起，您今日留言次数已达5次");
		}
		Leavemsg lmsg = new Leavemsg();
		// 对内容 进行 文本脱敏
		lmsg.setLmContent(HtmlUtil.toHtml(message));
		lmsg.setLmTime(new Date());
		lmsg.setUid(uid);
		// 添加到数据库
		return lm.insertSelective(lmsg);
	}

	// 查询 用户新留言数（未回复）
	public int queryNewNotReplayLeaveMsgCnt() {
		LeavemsgExample le = new LeavemsgExample();
		le.createCriteria().andStateLessThan(MyConstants.REPLYED_MSG).andLmTimeBetween(TimeUtil.getBeforeByHourTime(1),
				new Date());
		return lm.countByExample(le);
	}

}
