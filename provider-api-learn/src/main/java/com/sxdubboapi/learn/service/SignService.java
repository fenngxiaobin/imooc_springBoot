package com.sxdubboapi.learn.service;

import com.sxdubboapi.learn.domain.Sign;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-19 13:49.
 **/
public interface SignService {

    public List<Sign> findByUserId(Integer userId);
    public Sign addSign(Sign sign);
    public void deleteSign(Integer id);
}
