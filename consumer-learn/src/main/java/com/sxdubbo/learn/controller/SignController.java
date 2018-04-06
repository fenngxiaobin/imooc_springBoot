package com.sxdubbo.learn.controller;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.sxdubboapi.learn.domain.Credits;
import com.sxdubboapi.learn.domain.Sign;
import com.sxdubboapi.learn.service.CreditsService;
import com.sxdubboapi.learn.service.SignService;
import com.sxdubboapi.learn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * created by  luwei
 * 2018-03-19 13:50.
 **/
@Controller
@RequestMapping("/sign")
public class SignController {
    @Autowired
    public SignService signService;
    @Autowired
    public UserService userService;
    @Autowired
    public CreditsService creditsService;

    @GetMapping("/getSign")
    public String getSignByUserId(@RequestParam("userId") Integer userId, Model model){
        List<Sign> signList = signService.findByUserId(userId);
        model.addAttribute("signList",signList);
        Date date = new Date();
        String day = String.format("%te", date);
        for(int i=0;i<signList.size();i++){
            if(String.valueOf(signList.get(i).getDay()).equals(day)){
                model.addAttribute("flag",1);
            }
        }
        return "mycenter/sign/sign_get";
    }
    @PostMapping("/addSign")
    @ResponseBody
    public String addSign(@Valid Sign sign, HttpServletRequest request, HttpServletResponse response){
        sign.setCreateDate(new Date());
        Sign sign1 = signService.addSign(sign);
        Credits credits = creditsService.findByUserId(sign.getUserId());
        Integer credit = credits.getCredit() + 2;
        credits.setCredit(credit);
        Credits credits1 = creditsService.addCredits(credits);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        session.setAttribute("credits",credits1);

        if(sign1 != null){
            return "success";
        }else{
            return "error";
        }
    }
}
