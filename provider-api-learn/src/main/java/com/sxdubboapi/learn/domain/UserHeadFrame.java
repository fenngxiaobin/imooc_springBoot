package com.sxdubboapi.learn.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * created by  luwei
 * 2018-03-18 19:02.
 **/

public class UserHeadFrame implements Serializable{

    private Integer id;


    private HeadFrame headFrame;


    private User user;

    private Date createDate;

    private Integer choice;//0:表示不选，1：表示选择

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public HeadFrame getHeadFrame() {
        return headFrame;
    }

    public void setHeadFrame(HeadFrame headFrame) {
        this.headFrame = headFrame;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getChoice() {
        return choice;
    }

    public void setChoice(Integer choice) {
        this.choice = choice;
    }
}
