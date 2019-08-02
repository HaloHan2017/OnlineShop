package com.yc.olshop.bean;

public class Orderitem {
    private Integer oitemId;

    private Integer pid;

    private Integer pcount;

    private Double sumMoney;

    private String oid;

    private Double prealPrice;

		// 关联 product
	private Product product;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
    public Integer getOitemId() {
        return oitemId;
    }

    public void setOitemId(Integer oitemId) {
        this.oitemId = oitemId;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPcount() {
        return pcount;
    }

    public void setPcount(Integer pcount) {
        this.pcount = pcount;
    }

    public Double getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(Double sumMoney) {
        this.sumMoney = sumMoney;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }

    public Double getPrealPrice() {
        return prealPrice;
    }

    public void setPrealPrice(Double prealPrice) {
        this.prealPrice = prealPrice;
    }
}