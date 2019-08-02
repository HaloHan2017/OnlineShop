package com.yc.olshop.pojo;

import java.util.Date;

public class ViewObj {
	private String pid;
	private Date viewedTime;// 商品的历史浏览时间

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public Date getViewedTime() {
		return viewedTime;
	}

	public void setViewedTime(Date viewedTime) {
		this.viewedTime = viewedTime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((pid == null) ? 0 : pid.hashCode());
		result = prime * result + ((viewedTime == null) ? 0 : viewedTime.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		ViewObj vo = (ViewObj) obj;
		if (vo.getPid().equals(vo.getPid())) {
			return true;
		}
		return false;
	}

}
