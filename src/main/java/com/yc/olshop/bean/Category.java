package com.yc.olshop.bean;

import java.util.Date;

public class Category {
	private Integer cid;

	private String cname;

	private Date createTime;

	// 附加属性
	private int prodNum; // 该类别下的所有商品数量
	private int prodSales = 0; // 该类别下的所有商品数量 的销售数量
	private int ordersNum; // 订单数量

	public int getOrdersNum() {
		return ordersNum;
	}

	public void setOrdersNum(int ordersNum) {
		this.ordersNum = ordersNum;
	}

	public int getProdSales() {
		return prodSales;
	}

	public void setProdSales(int prodSales) {
		this.prodSales = prodSales;
	}

	public int getProdNum() {
		return prodNum;
	}

	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname == null ? null : cname.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}