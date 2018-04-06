package com.sxdubboapi.learn.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by fxb on 18-3-8.
 */
public class QaReply implements Serializable {
    //  回复的ID
    private Integer id;

    //  回复的用户
    private User user;

    //    回复所属的主问题
    private Qa qa;


    private String content;
    //    回复的时间
    private Date createDate;

    //  被回复的回复  允许为空 为空表示顶级回复
    private Integer qaReplyToPOId;   // 被回复的ID

    //    回答数
    private Integer answers;

    // 如果是评论 则指定回答的id  否则为null 方便一个回答下的所有回复
    private Integer qaReplyId;

    //    保存被回复的评论的用户的name
    private String toUserName;

    public String getToUserName() {
        return toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }

    public Integer getQaReplyId() {
        return qaReplyId;
    }

    public void setQaReplyId(Integer qaReplyId) {
        this.qaReplyId = qaReplyId;
    }

    public Integer getAnswers() {
        return answers;
    }

    public void setAnswers(Integer answers) {
        this.answers = answers;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Qa getQa() {
        return qa;
    }

    public void setQa(Qa qa) {
        this.qa = qa;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getQaReplyToPOId() {
        return qaReplyToPOId;
    }

    public void setQaReplyToPOId(Integer qaReplyToPOId) {
        this.qaReplyToPOId = qaReplyToPOId;
    }
}
