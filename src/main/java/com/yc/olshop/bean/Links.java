package com.yc.olshop.bean;

import java.util.Date;

public class Links {
    private Integer lid;

    private String lname;

    private String lurl;

    private Date ltime;

    public Integer getLid() {
        return lid;
    }

    public void setLid(Integer lid) {
        this.lid = lid;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname == null ? null : lname.trim();
    }

    public String getLurl() {
        return lurl;
    }

    public void setLurl(String lurl) {
        this.lurl = lurl == null ? null : lurl.trim();
    }

    public Date getLtime() {
        return ltime;
    }

    public void setLtime(Date ltime) {
        this.ltime = ltime;
    }
}