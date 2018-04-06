package com.sxdubbo.learn.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * created by  luwei
 * 2018-03-18 16:05.
 **/
@Entity
@Table(name = "follow")
public class FollowPO implements Serializable{

    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne(optional = true)
    @JoinColumn(name = "user1_id")
    private UserPO userPO1;

    @ManyToOne(optional = true)
    @JoinColumn(name = "user2_id")
    private UserPO userPO2;

    private Date createDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UserPO getUserPO1() {
        return userPO1;
    }

    public void setUserPO1(UserPO userPO1) {
        this.userPO1 = userPO1;
    }

    public UserPO getUserPO2() {
        return userPO2;
    }

    public void setUserPO2(UserPO userPO2) {
        this.userPO2 = userPO2;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
