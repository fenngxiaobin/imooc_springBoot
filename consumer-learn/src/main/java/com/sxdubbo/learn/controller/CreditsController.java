package com.sxdubbo.learn.controller;

import com.sxdubboapi.learn.service.CreditsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * created by  luwei
 * 2018-03-20 11:01.
 **/
@Controller
@RequestMapping("/credits")
public class CreditsController {
    @Autowired
    public CreditsService creditsService;
//
//    @RequestMapping("/mall")
//    public String mall(){
//
//    }
}
