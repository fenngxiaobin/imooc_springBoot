package com.sxdubbo.learn.domain;

import com.sxdubboapi.learn.domain.Qa;
import com.sxdubboapi.learn.domain.QaReply;
import com.sxdubboapi.learn.domain.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by fxb on 18-3-8.
 */
@Entity
@Table(name = "questionReplys")
public class QaReplyPO implements Serializable{
    //  回复的ID
    @Id
    @GeneratedValue
    private Integer id;

    //  回复的用户
    @ManyToOne
    @JoinColumn(name = "userId")
    private UserPO userPO;

    //    回复所属的主问题
    @ManyToOne
    @JoinColumn(name = "qaId")
    private QaPO qaPO;


    private String content;
    //    回复的时间
    private Date createDate;

    //  被回复的回复  允许为空 为空表示顶级回复
    private Integer qaReplyToPOId;   // 被回复的ID

    //    回答数
    private Integer answers;

    // 如果是评论 则指定回答的id  否则为null  方便一个回答下的所有回复
    private Integer qaReplyId;

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

    public UserPO getUserPO() {
        return userPO;
    }

    public void setUserPO(UserPO userPO) {
        this.userPO = userPO;
    }

    public QaPO getQaPO() {
        return qaPO;
    }

    public void setQaPO(QaPO qaPO) {
        this.qaPO = qaPO;
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
