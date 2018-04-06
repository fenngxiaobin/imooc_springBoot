package com.sxdubbo.learn.controller;

import com.sxdubboapi.learn.domain.Follow;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.service.FollowService;
import com.sxdubboapi.learn.service.UserService;
import org.apache.poi.ss.usermodel.Footer;
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
 * 2018-03-18 16:23.
 **/
@Controller
@RequestMapping("/follow")
public class FollowController {
    @Autowired
    public FollowService followServicce;

    @Autowired
    public UserService userService;

    @RequestMapping("/listAttention")
    public String findFollow(@RequestParam("user1Id") Integer user1Id,Model model){
        List<Follow> attentionList = followServicce.findByUser1_id(user1Id);
        model.addAttribute("attentionList",attentionList);
        return "mycenter/follow/list_attention";
    }
    @RequestMapping("/listFans")
    public String listFans(@RequestParam("user2Id") Integer user2Id,Model model){
        List<Follow> fansList = followServicce.findByUser2_id(user2Id);

        List<Follow> attentionList = followServicce.findByUser1_id(user2Id);

        model.addAttribute("fansList",fansList);
        model.addAttribute("attentionList",attentionList);
        return "mycenter/follow/list_fans";
    }

    @GetMapping("/addAttention")
    @ResponseBody
    public String addFollow(@RequestParam("userId") Integer userId, HttpServletRequest request, HttpServletResponse response){
//        System.out.println("userId"+userId);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        //将数据存储到session中

        User user1 = (User)session.getAttribute("userFront");
        User user2 = userService.getUserById(userId);
        Follow follow = new Follow();
        follow.setUser1(user1);
        follow.setUser2(user2);
        follow.setCreateDate(new Date());
        Follow follow1 = followServicce.addFollow(follow);
        if(follow1 != null){
            return "success";
        }else{
            return "error";
        }
    }

    @RequestMapping("/deleteAttention")
    @ResponseBody
    public String deleteFollow(@RequestParam("userId") Integer userId, HttpServletRequest request, HttpServletResponse response){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        //将数据存储到session中

        User user1 = (User)session.getAttribute("userFront");

        Follow follow = followServicce.findByUser1AndUser2(user1.getId(),userId);
        followServicce.deleteFollow(follow.getId());
        return "success";

    }
}
