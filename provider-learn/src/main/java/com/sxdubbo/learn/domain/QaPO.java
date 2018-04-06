package com.sxdubbo.learn.domain;

import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.domain.Video;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by fxb on 18-3-8.
 */
@Entity
@Table(name = "questions")
public class QaPO implements Serializable {
    @Id
    @GeneratedValue
    private Integer id;

    private String title;

    private String content;

    //    问答所属标签
    private String label;

    @ManyToOne
    @JoinColumn(name = "userId")
    private UserPO userPO;

    //    回答数
    private Integer answers;

    //    提问日期
    private Date createDate;

    //    所属视频的ID
    @ManyToOne
    @JoinColumn(name = "videoId")
    private VideoPO videoPO;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public UserPO getUserPO() {
        return userPO;
    }

    public void setUserPO(UserPO userPO) {
        this.userPO = userPO;
    }

    public Integer getAnswers() {
        return answers;
    }

    public void setAnswers(Integer answers) {
        this.answers = answers;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public VideoPO getVideoPO() {
        return videoPO;
    }

    public void setVideoPO(VideoPO videoPO) {
        this.videoPO = videoPO;
    }
}
