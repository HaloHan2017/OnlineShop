package com.yc.olshop.bean;

import java.util.Date;

public class Adminloginrecord {
    private Integer alrId;

    private String loginLocation;

    private String loginIp;

    private Date loginDate;

    private Integer aid;

    private Integer action;

    //自定义字段
    private String aname;
    
    private int atype;
    
    public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public int getAtype() {
		return atype;
	}

	public void setAtype(int atype) {
		this.atype = atype;
	}
    
    public Integer getAlrId() {
        return alrId;
    }

    public void setAlrId(Integer alrId) {
        this.alrId = alrId;
    }

    public String getLoginLocation() {
        return loginLocation;
    }

    public void setLoginLocation(String loginLocation) {
        this.loginLocation = loginLocation == null ? null : loginLocation.trim();
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getAction() {
        return action;
    }

    public void setAction(Integer action) {
        this.action = action;
    }
}