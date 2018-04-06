package com.sxdubboapi.learn.service;

import com.sxdubboapi.learn.domain.Follow;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-18 16:21.
 **/
public interface FollowService {

    public List<Follow> findByUser1_id(Integer user1Id);
    public List<Follow> findByUser2_id(Integer user2Id);
    public Follow addFollow(Follow follow);
    public void deleteFollow(Integer id);
    public Integer countByUser1_id(Integer user1Id);
    public Integer countByUser2_id(Integer user2Id);
    public Follow findByUser1AndUser2(Integer user1,Integer user2);
}
