package com.yc.olshop.bean;

import java.util.Date;

public class Comment {
	private Integer commId;

	private Integer pid;

	private Integer uid;

	private Date commTime;

	private Integer commStars;

	private String commContent;
	// �����û���
	private User user;

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	public Integer getCommId() {
		return commId;
	}

	public void setCommId(Integer commId) {
		this.commId = commId;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Date getCommTime() {
		return commTime;
	}

	public void setCommTime(Date commTime) {
		this.commTime = commTime;
	}

	public Integer getCommStars() {
		return commStars;
	}

	public void setCommStars(Integer commStars) {
		this.commStars = commStars;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent == null ? null : commContent.trim();
	}

	@Override
	public String toString() {
		return "Comment [commId=" + commId + ", pid=" + pid + ", uid=" + uid + ", commTime=" + commTime + ", commStars="
				+ commStars + ", commContent=" + commContent + ", user=" + user + "]";
	}

}