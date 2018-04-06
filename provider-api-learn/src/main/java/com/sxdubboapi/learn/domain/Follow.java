package com.sxdubboapi.learn.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * created by  luwei
 * 2018-03-18 16:05.
 **/
public class Follow implements Serializable{


    private Integer id;


    private User user1;


    private User user2;

    private Date createDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    public User getUser2() {
        return user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
