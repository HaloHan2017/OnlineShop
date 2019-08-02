package com.yc.olshop.pojo;

import java.util.List;

public class Cart {
	private Double totalMoney;// 总金额
	// 关联CartItem
	private List<CartItem> citemList;

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public List<CartItem> getCitemList() {
		return citemList;
	}

	public void setCitemList(List<CartItem> citemList) {
		this.citemList = citemList;
	}

}
