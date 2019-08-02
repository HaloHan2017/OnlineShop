package com.yc.olshop.bean;

import java.util.Date;

public class Favorite {
    private Integer favId;

    private Integer pid;

    private Integer uid;

    private Date favTime;

    public Integer getFavId() {
        return favId;
    }

    public void setFavId(Integer favId) {
        this.favId = favId;
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

    public Date getFavTime() {
        return favTime;
    }

    public void setFavTime(Date favTime) {
        this.favTime = favTime;
    }
}