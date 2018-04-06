package com.sxdubbo.learn.controller;

import com.sxdubboapi.learn.domain.*;
import com.sxdubboapi.learn.service.*;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.sxdubbo.learn.utils.FileUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/mycenter")
public class MycenterController {
    @Autowired
    public UserCourseService userCourseService;

    @Autowired
    public CourseService courseService;

    @Autowired
    public UserVideoService userVideoService;

    @Autowired
    public CommentService commentService;

    @Autowired
    public UserTestService userTestService;

    @Autowired
    public TestPaperService testPaperService;

    @Autowired
    public ChoiceQuestionService choiceQuestionService;

    @Autowired
    public TOrFQuestionService tOrFQuestionService;

    @Autowired
    public UserService userService;

    @Autowired
    public CreditsService creditsService;
    @Autowired
    public FollowService followService;
    @Autowired
    public UserHeadFrameService userHeadFrameService;
    @Autowired
    public SignService signService;
    @Autowired
    public  HeadFrameService headFrameService;
    @Autowired
    public QaService qaService;
    @Autowired
    public QaReplyService qaReplyService;
    @Autowired
    public  VideoService videoService;
    @Autowired
    public ScheduleService scheduleService;

    @Value("${web.upload-path}")
    private String filePath;

    @GetMapping("/myprofile")
    public String profile(HttpServletRequest request, HttpServletResponse response,Model model){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("userFront");


        if(user != null){
            Credits credits = creditsService.findByUserId(user.getId());
            Integer attentionNum = followService.countByUser1_id(user.getId());
            Integer fansNum = followService.countByUser2_id(user.getId());
            UserHeadFrame userHeadFrame = userHeadFrameService.findByUserIdAndChoice(user.getId(),1);
            List<UserVideo> userVideoList = userVideoService.findByUserId(user.getId());
            List<Sign> signList = signService.findByUserId(user.getId());

            double user_time= 0.0;
            if(userVideoList != null){
                for(int i=0;i<userVideoList.size();i++){
                    user_time = user_time + userVideoList.get(i).getProgress();
                }
            }


            model.addAttribute("attentionNum",attentionNum);
            model.addAttribute("fansNum",fansNum);
            model.addAttribute("credits",credits);
            model.addAttribute("userHeadFrame",userHeadFrame);
            model.addAttribute("user_time",user_time);
            model.addAttribute("sign_num",signList.size());
        }
        return "mycenter/profile/myprofile";
    }
    @GetMapping("/modify")
    public String modify(){
     return "mycenter/profile/modify";
    }
    public List<UserCourse> getUserAllcourse(Integer userid){
        return userCourseService.findByUserId(userid);
    }
    @GetMapping("/favorite")
    public String favoriteCourse(Model model, @RequestParam("userId") Integer userId){
        System.out.println("here is userId"+userId);
        List<UserCourse> userCourseList = getUserAllcourse(userId);
        List<Course> showUserCourseList = new ArrayList<>();
        for(int i=0; i<userCourseList.size(); i++) {
//            BeanUtils.copyProperties( userCourseList.get(i).getCourseId(),showUserCourseList.get(i).getId());
            Course course = courseService.findById(userCourseList.get(i).getCourse().getId());
//            course.setId(userCourseList.get(i).getCourseId());
            showUserCourseList.add(course);
        }
        model.addAttribute("userCourseList", userCourseList);
        model.addAttribute("showUserCourseList", showUserCourseList);
        return "mycenter/course/favorite";
    }
    @GetMapping("/recent")
    public String recent(){
        return "mycenter/course/recent";
    }
    @GetMapping("/myanswer")
    public String myanswer(Model model,HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession();
        User user = (User)session.getAttribute("userFront");
        List<QaReply> qaReplyList=qaReplyService.findByUser(user);
        List<Qa> qaList =new ArrayList<>();
        for(int i = 0;i<qaReplyList.size();i++) {
            qaList.add(qaService.findById(qaReplyList.get(i).getQa().getId()));
        }
        List<Course> courseList=new ArrayList<>();
        for(int j = 0;j<qaList.size();j++) {
            courseList.add(courseService.findById(videoService.findById(qaList.get(j).getVideo().getId()).getCourseId()));
        }
        model.addAttribute("courseLists",courseList);
        model.addAttribute("qaReplyLists",qaReplyList);
        model.addAttribute("qaLists",qaList);
        return "mycenter/question/myanswer";
    }
    @GetMapping("/myquestion")
    public String myquestion(Model model,HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession();
        User user = (User)session.getAttribute("userFront");
        List<Qa> qaList=qaService.findByUser(user);
        List<Course> courseList=new ArrayList<>();
        for(int i = 0;i<qaList.size();i++) {
            courseList.add(courseService.findById(videoService.findById(qaList.get(i).getVideo().getId()).getCourseId()));
        }
        model.addAttribute("courseLists",courseList);
        model.addAttribute("qaLists",qaList);
        return "mycenter/question/myquestion";
    }
    @GetMapping("/myfollow")
    public String myfollow(){
        return "mycenter/question/myfollow";
    }
    @GetMapping("/score_list")
    public String score_list(Model model, HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession();
        User user = (User)session.getAttribute("userFront");
        List<UserTest> userTestList= userTestService.findByUser(user);
//        List<Course> courseList=courseService.findAllCourse();
        List<Course> courseList=new ArrayList<Course>();
        for(int i = 0;i<userTestList.size();i++){
            courseList.add(courseService.findById(userTestList.get(i).getCourse().getId()));
        }
//        for(int j = 0;j<courseList.size();j++){
//            System.out.println(courseList.get(j).getCourseName()+"testhahaha");
//        }
        for(int q = 0;q<userTestList.size();q++){
            System.out.println(userTestList.get(q).getCourse().getId());
        }
        model.addAttribute("courseList",courseList);
        model.addAttribute("userTestList",userTestList);
        return "mycenter/exam/score_list";
    }
    @GetMapping("/score")
    public String score(@RequestParam("id")Integer id , Model model, HttpServletRequest request, HttpServletResponse response){
        System.out.println(id);
        UserTest userTest = userTestService.findById(id);
        TestPaper testPaper = testPaperService.findById(userTest.getTestPaper().getId());
        Course course = courseService.findById(userTest.getCourse().getId());
        User user=userService.getUserById(course.getUserId());
        User user1=userService.getUserById(userTest.getUser().getId());
        model.addAttribute("user1",user1);
        model.addAttribute("user",user);
        model.addAttribute("course",course);
        model.addAttribute("userTest",userTest);
        String[] sourceStrArray = testPaper.getChoiceQuestionNum().split("/");
        List<ChoiceQuestion> choiceQuestions=new ArrayList<ChoiceQuestion>();
        for (int i = 0; i < sourceStrArray.length; i++) {
            ChoiceQuestion choiceQuestion = choiceQuestionService.findById(Integer.parseInt(sourceStrArray[i]));
            choiceQuestions.add(choiceQuestion);
            model.addAttribute("choiceQuestionLists", choiceQuestions);
        }
        String[] torfStrArray = testPaper.gettOrFQuestionNum().split("/");
        List<TOrFQuestion> tOrFQuestions=new ArrayList<TOrFQuestion>();
        for (int i = 0; i < torfStrArray.length; i++) {
            TOrFQuestion tOrFQuestion = tOrFQuestionService.findById(Integer.parseInt(torfStrArray[i]));
            tOrFQuestions.add(tOrFQuestion);
            model.addAttribute("tOrFQuestionLists", tOrFQuestions);
        }
        return "mycenter/exam/score";
    }
    @GetMapping("/schedule")
    public String schedule(Model model,HttpServletRequest request,HttpServletResponse response){
        HttpSession session=request.getSession();
        User user = (User)session.getAttribute("userFront");
        List<Schedule> scheduleList=scheduleService.findByUser(user);
        model.addAttribute("scheduleLists",scheduleList);
        return "mycenter/schedule/schedule";
    }

    @PostMapping("/addSchedule")
    public String addSchedule(@RequestParam(value="title") String title,@RequestParam(value="time") String time,@RequestParam(value="day") String day,HttpServletRequest request,HttpServletResponse response){
        HttpSession session=request.getSession();
        User user = (User)session.getAttribute("userFront");
        Schedule schedule=new Schedule();
        schedule.setTime(time);
        schedule.setDay(day);
        schedule.setCreateDate(new Date());
        schedule.setTitle(title);
        schedule.setUser(user);
        scheduleService.addSchedule(schedule);
        return "success";
    }

    @GetMapping("/community")
    public String community(){
        return "mycenter/community/community";
    }
    @GetMapping("/setting")
    public String setting(){
        return "mycenter/setting/mysetting";
    }
//    @GetMapping("/myprofile")
//    public String myprofile(){
//        return "mycenter/profile/myprofile";
//    }
    @GetMapping("/moment")
    public String moment(){
        return "mycenter/moment/moment";
    }
    @PostMapping("/addmoment")
    public String addmoment(Model model,HttpServletRequest request,HttpServletResponse response,
                            @RequestParam(value="image") String imgStr){
        HttpSession session=request.getSession();
        User user = (User)session.getAttribute("userFront");
        ServletContext application = request.getServletContext();
        application.setAttribute("testimg",imgStr);
        if (imgStr == null){ // 图像数据为空
        }
        else {
            Base64 base64=new Base64();
            String fileName = UUID.randomUUID().toString().replace("-", "")+".png";
//            BASE64Decoder decoder = new BASE64Decoder();
            try {
                // 获取上传文件的BASE编码
                String imgs = imgStr;
                try {
                    byte[] k = base64.decode(imgs.substring("data:image/png;base64,".length()));
                    InputStream is = new ByteArrayInputStream(k);
//                    String filePath = ClassUtils.getDefaultClassLoader().getResource("static/admin/upload/").getPath();
                    String filePath1 =filePath+"upload/";
//                    String suffixName = fileName.substring(fileName.lastIndexOf("."));
                    try {
                        filePath1 = URLDecoder.decode(filePath1, "utf-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }

                    System.out.println("hahachenggong");
                    try {
//                        String file_name = System.currentTimeMillis() + suffixName;
                        FileUtils.uploadFile(k, filePath1, fileName);
                    } catch (Exception e) {
                        // TODO: handle exception
                    }
                } catch (Exception e) {
                }
            } catch (Exception e) {
            }
            user.setHeadimg(fileName);
            userService.addUser(user);
            session.setAttribute("userFront",user);
        }
            return "success";
        }
    @GetMapping("/headframe")
    public String headframe(Model model, HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession();
        User user = (User)session.getAttribute("userFront");
        List<UserHeadFrame> userHeadFrames =userHeadFrameService.findByUserId(user.getId());
        List<HeadFrame> headFrames2=headFrameService.findAllHeadFrame();
        List<HeadFrame> headFrames1=new ArrayList<>();
        List list1=new ArrayList();
        List list2=new ArrayList();
        for (int j = 0;j<headFrames2.size();j++){
            list2.add(headFrames2.get(j).getId().toString());
        }
        for (int i = 0;i<userHeadFrames.size();i++) {
             headFrames1.add( headFrameService.findById(userHeadFrames.get(i).getHeadFrame().getId()));
             list1.add(userHeadFrames.get(i).getHeadFrame().getId().toString());
        }
        list2.removeAll(list1);
        List<HeadFrame> headFrames3=new ArrayList<>();
        for (int x = 0;x<list2.size();x++){
            headFrames3.add(headFrameService.findById(Integer.parseInt(list2.get(x).toString())));
        }
        model.addAttribute("headFramesLeft",headFrames3);
        model.addAttribute("userHeadFramesList",userHeadFrames);
        return "mycenter/headFrame/head_frame";
    }
    @PostMapping("/chooseheadframe")
    public  String chooseheadframe(@RequestParam(name="uhchoice" ,required = false)Integer id ,Model model, HttpServletRequest request, HttpServletResponse response){
        HttpSession session=request.getSession();
        User user = (User)session.getAttribute("userFront");
        if(id!=null) {
            List<UserHeadFrame> userHeadFrames = userHeadFrameService.findByUserId(user.getId());
            for (int i = 0; i < userHeadFrames.size(); i++) {
                if (userHeadFrames.get(i).getId() == id) {
                    userHeadFrames.get(i).setChoice(1);
                } else {
                    userHeadFrames.get(i).setChoice(0);
                }

                userHeadFrameService.addUserHeadFrame(userHeadFrames.get(i));
            }
            UserHeadFrame userHeadFrame = userHeadFrameService.findByUserIdAndChoice(user.getId(), 1);
            session.setAttribute("userHeadFrame", userHeadFrame);
        }
        return "redirect:/mycenter/headframe";

    }

    @GetMapping("modifyPassword")
    public String modifyPassword(){
        return "/mycenter/profile/modify_password";
    }
}


