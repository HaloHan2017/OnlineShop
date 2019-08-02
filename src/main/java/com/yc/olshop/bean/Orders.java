package com.yc.olshop.bean;

import java.util.Date;
import java.util.List;

public class Orders {
	private String oid;

	private Date ordertime;

	private Double totalMoney;

	private Integer status;

	private Integer uid;

	private String desc;

	private Integer addrId;

	// 附加属性---订单里的商品数
	private Integer prodCount;

	// 附加属性
	private List<Orderitem> oitemList;

	// 关联 user
	private User user;

	// 关联 address
	private Address addr;

	public Integer getProdCount() {
		return prodCount;
	}

	public void setProdCount(Integer prodCount) {
		this.prodCount = prodCount;
	}

	public Address getAddr() {
		return addr;
	}

	public void setAddr(Address addr) {
		this.addr = addr;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Orderitem> getOitemList() {
		return oitemList;
	}

	public void setOitemList(List<Orderitem> oitemList) {
		this.oitemList = oitemList;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid == null ? null : oid.trim();
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc == null ? null : desc.trim();
	}

	public Integer getAddrId() {
		return addrId;
	}

	public void setAddrId(Integer addrId) {
		this.addrId = addrId;
	}
}