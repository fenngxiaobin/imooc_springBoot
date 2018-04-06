package com.sxdubbo.learn.controller;

import com.sxdubboapi.learn.domain.Credits;
import com.sxdubboapi.learn.domain.HeadFrame;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.domain.UserHeadFrame;
import com.sxdubboapi.learn.service.CreditsService;
import com.sxdubboapi.learn.service.HeadFrameService;
import com.sxdubboapi.learn.service.UserHeadFrameService;
import com.sxdubboapi.learn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;

/**
 * created by  luwei
 * 2018-03-22 14:40.
 **/
@Controller
@RequestMapping("/headFrame")
public class UserHeadFrameController {

    @Autowired
    public UserHeadFrameService userHeadFrameService;
    @Autowired
    public UserService userService;
    @Autowired
    public HeadFrameService headFrameService;
    @Autowired
    public CreditsService creditsService;

    @RequestMapping("/addUserHeadFrame")
    @ResponseBody
    public String addUserHeadFrame(@Valid UserHeadFrame userHeadFrame, Model model,
                                   HttpServletRequest request, HttpServletResponse response, RedirectAttributes attributes){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        Credits credits = (Credits)session.getAttribute("credits");

        User user = userService.getUserById(userHeadFrame.getUser().getId());
        HeadFrame headFrame = headFrameService.findById((userHeadFrame.getHeadFrame().getId()));
        userHeadFrame.setUser(user);
        userHeadFrame.setHeadFrame(headFrame);
        userHeadFrame.setCreateDate(new Date());
        userHeadFrame.setChoice(0);
        UserHeadFrame userHeadFrame1 = userHeadFrameService.findByUserIdAndHeadFrameId(user.getId(),headFrame.getId());
        if(userHeadFrame1 == null) {
            if (credits != null) {
                if (headFrame.getPrice() <= credits.getCredit()) {
                    Credits credits1 = creditsService.findById(credits.getId());
                    credits1.setCredit(credits1.getCredit() - headFrame.getPrice());

                    Credits credits2 = creditsService.updateCredits(credits1);
                    session.setAttribute("credits", credits2);
                    userHeadFrameService.addUserHeadFrame(userHeadFrame);
                    return "success";
                } else {
                    return "credit_error";
                }
            }
        }else{
            return "headFrame_have";
        }
        return "other_error";
    }
}
