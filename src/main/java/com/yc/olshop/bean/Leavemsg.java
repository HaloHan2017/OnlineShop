package com.yc.olshop.bean;

import java.util.Date;

public class Leavemsg {
	private Integer lmId;

	private Integer uid;

	private String lmContent;

	private Date lmTime;

	private Integer state;

	private String lmReply;

	// 附加属性
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getLmId() {
		return lmId;
	}

	public void setLmId(Integer lmId) {
		this.lmId = lmId;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getLmContent() {
		return lmContent;
	}

	public void setLmContent(String lmContent) {
		this.lmContent = lmContent == null ? null : lmContent.trim();
	}

	public Date getLmTime() {
		return lmTime;
	}

	public void setLmTime(Date lmTime) {
		this.lmTime = lmTime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getLmReply() {
		return lmReply;
	}

	public void setLmReply(String lmReply) {
		this.lmReply = lmReply == null ? null : lmReply.trim();
	}

	@Override
	public String toString() {
		return "Leavemsg [lmId=" + lmId + ", uid=" + uid + ", lmContent=" + lmContent + ", lmTime=" + lmTime
				+ ", state=" + state + ", lmReply=" + lmReply + ", user=" + user + "]";
	}

}