package com.sxdubboapi.learn.service;

import com.sxdubboapi.learn.domain.HeadFrame;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-18 19:28.
 **/
public interface HeadFrameService {

    public HeadFrame addHeadFrame(HeadFrame headFrame);
    public HeadFrame updateHeadFrame(HeadFrame headFrame);
    public void deleteHeadFrame(Integer id);
    public List<HeadFrame> findAllHeadFrame();
    public HeadFrame findById(Integer id);
}
