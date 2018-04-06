package com.sxdubboapi.learn.domain;

import java.io.Serializable;

/**
 * created by  luwei
 * 2018-01-22 18:53.
 **/
public class BulletScreen implements Serializable{

    private Integer id;

    private String danmu;

    private Integer videoId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDanmu() {
        return danmu;
    }

    public void setDanmu(String danmu) {
        this.danmu = danmu;
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }
}
