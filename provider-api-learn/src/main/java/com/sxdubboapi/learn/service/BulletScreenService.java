package com.sxdubboapi.learn.service;

import com.sxdubboapi.learn.domain.BulletScreen;

import java.util.List;

/**
 * created by  luwei
 * 2018-01-22 19:59.
 **/
public interface BulletScreenService {

    public List<BulletScreen> findByVideoId(Integer videoId);
    public BulletScreen addBulletScreen(BulletScreen bulletScreen);
}
