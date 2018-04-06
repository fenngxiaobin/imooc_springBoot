package com.sxdubbo.learn.controller;


import com.sxdubboapi.learn.domain.Course;
import com.sxdubboapi.learn.domain.CourseScore;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.service.CourseScoreService;
import com.sxdubboapi.learn.service.CourseService;
import com.sxdubboapi.learn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import java.util.List;

@Controller
@RequestMapping("score")
public class CourseScoreController {
    @Autowired
    public UserService userService;
    @Autowired
    public CourseService courseService;
    @Autowired
    public CourseScoreService courseScoreService;

    @PostMapping("addScore")
    @ResponseBody
    public String addScore(@RequestParam(name = "courseId")Integer courseId, @RequestParam(name = "score")double score, HttpServletRequest request){
        HttpSession session=request.getSession();
        User user = (User)session.getAttribute("userFront");
        System.out.println(score+"haha");
        System.out.println("hahaha");
        CourseScore courseScore=new CourseScore();
        Course course=courseService.findById(courseId);
        CourseScore courseScore1=courseScoreService.findByCourseAndUser(course,user);
//        System.out.println(user.getUsername()+course.getCourseName()+score+"");
        courseScore.setId(courseScore1.getId());
        System.out.println("id:"+courseScore1.getId());
        courseScore.setCourse(course);
        courseScore.setUser(user);
        courseScore.setScore(score);
        courseScoreService.addScore(courseScore);

        List<CourseScore> courseScores=courseScoreService.findByCourse(course);
        double aveScore=0;
        if(courseScores!=null){
            for(int i=0;i<courseScores.size();i++){
                System.out.println("score:"+aveScore);
                aveScore+=courseScores.get(i).getScore();
            }
            aveScore=aveScore/courseScores.size();
        }else{
            aveScore=3;
        }
        course.setScore(aveScore);
        courseService.addCourse(course);


        System.out.println(courseScore);
        return "success";
    }
}
