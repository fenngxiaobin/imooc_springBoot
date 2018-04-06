package com.sxdubboapi.learn.service;

import com.sxdubboapi.learn.domain.Credits;

/**
 * created by  luwei
 * 2018-03-18 19:21.
 **/
public interface CreditsService {
    public Credits addCredits(Credits credits);
    public Credits updateCredits(Credits credits);
    public Credits findByUserId(Integer userId);
    public Credits findById(Integer id);
}
