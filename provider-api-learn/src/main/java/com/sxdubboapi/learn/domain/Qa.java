package com.sxdubboapi.learn.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by fxb on 18-3-8.
 */
public class Qa implements Serializable {

    private Integer id;

    private String title;

    private String content;

    //    问答所属标签
    private String label;

    private User user;

    //    回答数
    private Integer answers;

    //    提问日期
    private Date createDate;

    //    所属视频的ID
    private Video video;

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }
}
