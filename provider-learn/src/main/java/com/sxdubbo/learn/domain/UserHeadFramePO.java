package com.sxdubbo.learn.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * created by  luwei
 * 2018-03-18 19:02.
 **/
@Entity
@Table(name = "userHeadFrame")
public class UserHeadFramePO implements Serializable{
    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne(optional = true)
    @JoinColumn(name = "head_frame_id")
    private HeadFramePO headFramePO;

    @ManyToOne(optional = true)
    @JoinColumn(name = "user_id")
    private UserPO userPO;

    private Date createDate;

    private Integer choice;//0:表示不选，1：表示选择

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public HeadFramePO getHeadFramePO() {
        return headFramePO;
    }

    public void setHeadFramePO(HeadFramePO headFramePO) {
        this.headFramePO = headFramePO;
    }

    public UserPO getUserPO() {
        return userPO;
    }

    public void setUserPO(UserPO userPO) {
        this.userPO = userPO;
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
