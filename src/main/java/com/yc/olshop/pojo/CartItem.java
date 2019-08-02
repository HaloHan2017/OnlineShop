package com.yc.olshop.pojo;

import com.yc.olshop.bean.Product;

public class CartItem {
	private Product product;// 商品id（每个明细对应一个商品）
	private Double sumMoney;
	private Integer pcount;// 商品数量

	public Double getSumMoney() {
		return sumMoney;
	}

	public void setSumMoney(Double sumMoney) {
		this.sumMoney = sumMoney;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getPcount() {
		return pcount;
	}

	public void setPcount(Integer pcount) {
		this.pcount = pcount;
	}

}
