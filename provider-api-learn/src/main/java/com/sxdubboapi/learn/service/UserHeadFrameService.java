package com.sxdubboapi.learn.service;

import com.sxdubboapi.learn.domain.UserHeadFrame;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-18 19:41.
 **/
public interface UserHeadFrameService {
    public UserHeadFrame addUserHeadFrame(UserHeadFrame userHeadFrame);
    public UserHeadFrame updateUserHeadFrame(UserHeadFrame userHeadFrame);
    public void deleteUserHeadFrame(Integer id);
    public UserHeadFrame findByUserIdAndChoice(Integer userId,Integer choice);
    public List<UserHeadFrame> findByUserId(Integer userId);
    public List<UserHeadFrame> findAllUserHeadFrame();
    public UserHeadFrame findByUserIdAndHeadFrameId(Integer userId,Integer headFrameId);
}
