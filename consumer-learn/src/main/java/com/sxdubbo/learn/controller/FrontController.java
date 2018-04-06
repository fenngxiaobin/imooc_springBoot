package com.sxdubbo.learn.controller;

import com.sxdubboapi.learn.domain.Course;
import com.sxdubboapi.learn.domain.Follow;
import com.sxdubboapi.learn.domain.Qa;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.service.CourseService;
import com.sxdubboapi.learn.service.FollowService;
import com.sxdubboapi.learn.service.QaService;
import com.sxdubboapi.learn.service.UserService;
import org.jboss.netty.handler.codec.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/front")
public class FrontController {
    @Autowired
    public CourseService courseService;
    @Autowired
    public UserService userService;
    @Autowired
    public QaService qaService;
    @Autowired
    public FollowService followService;

    @GetMapping("/index")
    public String index(Model model,HttpServletRequest request, HttpServletResponse response){
        List<Course> courseList = courseService.findAllCourse();
        List<User> userList = userService.findAllUser();
        List<Qa> qaList= qaService.findAllQa();

//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
//        HttpSession session = request.getSession();
//        User user = (User)session.getAttribute("userFront");

        model.addAttribute("courseList",courseList);
        model.addAttribute( "userList",userList);
        model.addAttribute( "qaList",qaList);
        return "/front/index";
    }

    @GetMapping("/teacher")
    public String teacher(@RequestParam("id") Integer id, HttpServletRequest request, HttpServletResponse response, Model model){

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        //将数据存储到session中
        User user = (User)session.getAttribute("userFront");
        List<Course> courseList = courseService.findByUserId(id);
        if(user!=null){
            List<Follow> followList = followService.findByUser1_id(user.getId());
            if(followList != null){
                model.addAttribute("attentionList",followList);
            }
        }


        User lecture = userService.getUserById(id);

        model.addAttribute("courseList",courseList);
        model.addAttribute( "lecture",lecture);


        return "/front/faculty/teacher";
    }

    @GetMapping("/aboutUs")
    public String aboutUs(){
        return "/front/more_info/about_us";
    }

    @GetMapping("/teamInfo")
    public String teamInfo(){
        return "/front/more_info/team_info";
    }
    @GetMapping("/lectureEnroll")
    public String lectureEnroll(){
        return "/front/more_info/lecture_enroll";
    }
    @GetMapping("/contactUs")
    public String contactUs(){
        return "/front/more_info/contact_us";
    }
    @GetMapping("/friendLink")
    public String friendLink(){
        return "/front/more_info/friend_link";
    }
    @GetMapping("/creditsRule")
    public String creditsRule(){
        return "/front/more_info/credits_rule";
    }
    @GetMapping("/jdApply")
    public String jdApply(){
        return "/front/more_info/jd_apply";
    }

    @GetMapping("/lectureEnrollInfo")
    public String lectureEnrollInfo(Model model,HttpServletRequest request, HttpServletResponse response){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userFront");
//        User user = userService.getUserById()
        if(user!= null && user.getUserStatus()==1){
            model.addAttribute("userToLecture",user);
        }
        return "/front/more_info/lecture_enroll_info";
    }

}
