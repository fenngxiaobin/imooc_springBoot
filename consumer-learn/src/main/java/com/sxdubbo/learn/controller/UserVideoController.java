package com.sxdubbo.learn.controller;

import com.sxdubboapi.learn.domain.*;
import com.sxdubboapi.learn.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * Created by fxb on 18-2-28.
 */
@Controller
@RequestMapping(value = "vp")
public class UserVideoController {
    @Autowired
    public UserVideoService userVideoService;

    @Autowired
    public UserCourseService userCourseService;
    @Autowired
    public VideoService videoService;
    @Autowired
    public CreditsService creditsService;
    @Autowired
    public UserService userService;
    @Autowired
    public CourseService courseService;

    private User user=new User();

    private Video video=new Video();


    @RequestMapping(value = "watch")
    public String watch(Model model){
        if (userVideoService.findByUserIdAndVideoId(user.getId(),video.getId())==null){
            return "/admin/video/watch";
        }else{
            UserVideo userVideo1=userVideoService.findByUserIdAndVideoId(user.getId(),video.getId());
            model.addAttribute("progress",userVideo1.getProgress());
            return "/admin/video/watch";
        }

    }


    @RequestMapping(value = "/addRecord")
    @ResponseBody//此处不能省略 否则ajax无法解析返回值
    public String addRecord(@Valid UserVideo userVideo, HttpServletRequest request, HttpServletResponse response){
//        System.out.println("videoId:"+userVideo.getVideoId()+"%%%%%%%%userId:"+userVideo.getUserId());
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();

        UserVideo userVideo1 = userVideoService.findByUserIdAndVideoId(userVideo.getUserId(),userVideo.getVideoId());
        UserCourse userCourse = userCourseService.findByUserIdAndCourseId(userVideo.getUserId(),userVideo.getCourseId());
//        UserCourse userCourse = new UserCourse();

        List<Video> videoList = videoService.findByCourseId(userVideo.getCourseId());
        double total_time = 0.0;
        for(int i=0;i< videoList.size();i++){
            total_time = total_time + videoList.get(i).getVideoDuration();
        }

        if(userVideo1==null){
            userVideo.setCreateDate(new Date());
            userVideo.setModifyDate(new Date());
            userVideo.setFinished(0);

            Video video = videoService.findById(userVideo.getVideoId());
            Double progress = userVideo.getProgress();
            Double videoDuration = video.getVideoDuration();
            Credits credits = creditsService.findByUserId(userVideo.getUserId());
            if(progress.intValue() == videoDuration.intValue()){
                userVideo.setFinished(1);
                Integer credit = credits.getCredit() + 2;
                credits.setCredit(credit);
                Credits credits1 = creditsService.updateCredits(credits);
                session.setAttribute("credits",credits1);
                userVideo.setFinished(1);
            }else{
                userVideo.setFinished(0);
            }
            UserVideo userVideo2=userVideoService.addUserVideo(userVideo);

            List<UserVideo> userVideoList = userVideoService.findByUserIdAndCourseId(userVideo2.getUserId(),userVideo2.getCourseId());
            double learn_time = 0.0;
            for(int i=0;i< userVideoList.size();i++){
                learn_time = learn_time + userVideoList.get(i).getProgress();
            }
            if(userCourse == null){
                UserCourse userCourse1 = new UserCourse();
                userCourse1.setUser(userService.getUserById(userVideo.getUserId()));
                userCourse1.setCourse(courseService.findById(userVideo.getCourseId()));
                userCourse1.setVideo(videoService.findById(userVideo.getVideoId()));
                userCourse1.setCreateDate(new Date());
                userCourse1.setModifyDate(new Date());
                userCourse1.setProgress(String.valueOf(learn_time/ total_time * 100));
                userCourseService.addUserCourse(userCourse1);
            }else{
                userCourse = userCourseService.findByUserIdAndCourseId(userVideo.getUserId(),userVideo.getCourseId());
//                System.out.println("learn_time"+learn_time+"------total_time"+total_time);
                userCourse.setProgress(String.valueOf(learn_time / total_time * 100));
                userCourse.setVideo(videoService.findById(userVideo.getVideoId()));
                userCourseService.updateUserCourse(userCourse);
            }
        }else{
            userVideo.setId(userVideo1.getId());
            userVideo.setCreateDate(userVideo1.getCreateDate());
            userVideo.setModifyDate(new Date());

            Video video = videoService.findById(userVideo1.getVideoId());
            Double progress = userVideo.getProgress();
            Double videoDuration = video.getVideoDuration();
            Credits credits = creditsService.findByUserId(userVideo1.getUserId());
//
//            System.out.println("原来方法："+progress.intValue()+"---"+videoDuration.intValue());
//            System.out.println("现在方法"+Math.floor(progress)+"^^^^^"+Math.floor(videoDuration));
            if(userVideo1.getFinished()==0 && progress.intValue() == videoDuration.intValue()){
                userVideo.setFinished(1);
                Integer credit = credits.getCredit() + 2;
                credits.setCredit(credit);
                Credits credits1 = creditsService.updateCredits(credits);
                session.setAttribute("credits",credits1);
            }else{
                userVideo.setFinished(userVideo1.getFinished());
            }
            UserVideo userVideo2 = userVideoService.updateUserVideo(userVideo);

            List<UserVideo> userVideoList = userVideoService.findByUserIdAndCourseId(userVideo.getUserId(),userVideo.getCourseId());
            double learn_time = 0.0;
            for(int i=0;i< userVideoList.size();i++){
                learn_time = learn_time + userVideoList.get(i).getProgress();
            }
            System.out.println("learn_time"+learn_time+"             total_time:"+total_time);
            userCourse = userCourseService.findByUserIdAndCourseId(userVideo1.getUserId(),userVideo1.getCourseId());
            userCourse.setProgress(String.valueOf(learn_time / total_time * 100));
            userCourseService.updateUserCourse(userCourse);
        }
        return "success";
    }

    //    fxb 3-1
    @RequestMapping(value = "danmu")
    public String danmu(Model model){
        return "/admin/video/danmu";

    }
}
