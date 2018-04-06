package com.sxdubbo.learn.controller;

//import com.google.gson.Gson;
import com.sxdubboapi.learn.domain.*;
import com.sxdubboapi.learn.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.*;
import java.util.logging.Logger;

/**
 * created by  luwei
 * 2018-03-08 14:49.
 **/
@Controller
@RequestMapping("/qa")
public class QaController {
    @Autowired
    public QaService qaService;
    @Autowired
    public QaReplyService qaReplyService;
    @Autowired
    public UserService userService;
    @Autowired
    public VideoService videoService;

    @Autowired
    public CourseService courseService;


//    @GetMapping("/qaView")
//    public String qaView(@RequestParam("id") Integer id, Model model){
//        Qa qa = qaService.findById(id);
//        List<QaReply> qaReplyList = qaReplyService.findByQa(qa);
//        model.addAttribute("qaReplyList",qaReplyList);
//        model.addAttribute("qa",qa);
////        attributes.addAttribute("id",qa.getId());
//        return "/front/qa/qa_view";
//    }
    //菜单导航栏  问答栏目
//    展示问题列表


    @GetMapping("/frontQa")
    public String frontQa(Model model){
        System.out.println("controller qaRepository.findAll()");
        List<Qa> qaList = qaService.findAllQa();
        System.out.println("controller qaRepository.findAll().size():"+qaList.size());
        model.addAttribute("qaList",qaList);
//        qaList排序
        Collections.sort(qaList, new Comparator<Qa>() {
            @Override
            public int compare(Qa o1, Qa o2) {
                return o2.getAnswers()- o1.getAnswers();
            }
        });
        List<Qa> qaList1=new LinkedList<>();
        if(qaList.size()>5){
            qaList1=qaList.subList(0,5);
        }else {
            qaList1=qaList;
        }
        HashMap<User,Integer> hashMap=new HashMap<>();
        List<QaReply> qaReplyList=qaReplyService.findAll();
        Iterator<QaReply> iterator=qaReplyList.iterator();
        while(iterator.hasNext()){
            QaReply qaReply=iterator.next();
            User user=qaReply.getUser();
            if (hashMap.containsKey(user)&&qaReply.getQaReplyId()==null){
                System.out.println("hahahahahahahahahahahahahahaha");
                hashMap.put(user,hashMap.get(user)+1);
            }else if(!hashMap.containsKey(user)&&qaReply.getQaReplyId()==null){
                System.out.println("ninininininininininininininini");
                hashMap.put(user,1);
            }
        }
        System.out.println(hashMap.toString());
        List<Map.Entry<User,Integer>> entryList=new LinkedList<>(hashMap.entrySet());
        System.out.println("entryList.size"+entryList.size());
        Collections.sort(entryList, new Comparator<Map.Entry<User, Integer>>() {
            @Override
            public int compare(Map.Entry<User, Integer> o1, Map.Entry<User, Integer> o2) {
                return o2.getValue()-o1.getValue();
            }
        });
        List<Map.Entry<User,Integer>> userList=new LinkedList<>();
//
        if(entryList.size()>5){
            userList=entryList.subList(0,5);
        }else {
            userList=entryList;
        }
        List<User> users=new LinkedList<>();
        for (Map.Entry<User,Integer> entry:userList){
            users.add(entry.getKey());
        }
        HashMap<String,Integer> hashMap1=new HashMap<>();
        for (Map.Entry<User,Integer> entry:hashMap.entrySet()){
            hashMap1.put(entry.getKey().getUsername(),entry.getValue());
        }
        System.out.println(hashMap1.toString());
        System.out.println("hashMap1.entrySet().size()"+hashMap1.entrySet().size());
        System.out.println("hotUserList"+users.size());
        model.addAttribute("hash",hashMap1);
        model.addAttribute("hotUserList",users);
        model.addAttribute("hotQaList",qaList1);
        return "/front/qa/front_qa";
    }


    @PostMapping("addQuestion")
    public String addQuestion(@RequestParam("userName")String userName,@RequestParam("label")String label,@RequestParam("title")String title,@RequestParam("content")String content,@RequestParam("videoId")Integer videoId){
        System.out.println(userName+label+title+content+videoId);
        User user=userService.findByUsername(userName);
        Video video=videoService.findById(videoId);
        Qa qa=new Qa();
        qa.setAnswers(0);
        qa.setUser(user);
//        video，此处如果在问答区提问，应该设为null
        qa.setVideo(video);
        qa.setCreateDate(new Date());
        qa.setLabel(label);
        qa.setTitle(title);
        qa.setContent(content);
        Qa qa1=qaService.saveQa(qa);
        return "redirect:/qa/frontQa";
    }

    /**
     * 添加评论内容
     * @param userName 用户name
     * @param content reply的内容
     * @param qaId  reply所对应的问题的ID
     * @param replyId reply所对应的answer(也是reply)的ID
     * @return
     */
    @PostMapping("/addReply")
    @ResponseBody
    public String addReply(@RequestParam("userName")String userName,@RequestParam("content")String content,@RequestParam("QaId")Integer qaId,@RequestParam("ReplyId")Integer replyId){
        System.out.println(userName+content+qaId+replyId);
        User user=userService.findByUsername(userName);
        Qa qa=qaService.findById(qaId);
        QaReply qaReply=new QaReply();
        qaReply.setUser(user);
        qaReply.setContent(content);
        qaReply.setCreateDate(new Date());
        qaReply.setQa(qa);
        qaReply.setQaReplyId(replyId);
//        区分answer与reply
        qaReply.setQaReplyToPOId(replyId);
//        保存回复信息  更新answer
        QaReply qaReply1=qaReplyService.saveQaReply(qaReply);
        QaReply qaReply2=qaReplyService.findById(replyId);
        qaReply2.setId(qaReply2.getId());
        qaReply2.setAnswers(qaReply2.getAnswers()+1);
        QaReply qaReply3=qaReplyService.saveQaReply(qaReply2);
        return "success";
    }

    /**
     * 此处有问题
     * @param userName
     * @param content
     * @param qaId
     * @return
     */
    @PostMapping("/addAnswer")
    public String addAnswer(@RequestParam(name = "qaid")String qaId,@RequestParam(name = "content")String content,@RequestParam(name = "userName")String userName){
        System.out.println(userName+content+qaId);
        User user=userService.findByUsername(userName);
        System.out.println(user.getHeadimg());
        Qa qa=qaService.findById(new Integer(qaId));
        System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+qa.getAnswers());
        qa.setAnswers(qa.getAnswers()+1);
        System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+qa.getAnswers());
        QaReply qaReply=new QaReply();
        qaReply.setUser(user);
        qaReply.setContent(content);
        qaReply.setCreateDate(new Date());
        qaReply.setQa(qa);
        qaReply.setAnswers(0);
        QaReply qaReply1=qaReplyService.saveQaReply(qaReply);
        Qa qa1=qaService.saveQa(qa);
        return "/front/qa/qa_view/";
    }

    @GetMapping("/qaView")
    public String qaView(@RequestParam(name = "id",required = true)Integer id,@RequestParam(value = "replyId",required = false)String replyId,Model model){
        Qa qa=qaService.findById(id);
        System.out.println("id:"+id);
        System.out.println(qa.getTitle());
        List<QaReply> qaReplyList=qaReplyService.findByQa(qa);
        System.out.println(qaReplyList.size()+"++");
//        3-14 fxb 只保留 问题的回答列表 不包含评论
        Iterator<QaReply> it=qaReplyList.iterator();
        while(it.hasNext()){
            QaReply qaReply=it.next();
//            只保留回答 不保留评论
            if(qaReply.getQaReplyToPOId()!=null){
                it.remove();
            }
        }

//        推荐问题
        List<Qa> recommendQaList=qaService.findByLabel(qa.getLabel());
        if(recommendQaList!=null){
            model.addAttribute("recommendQaList",recommendQaList);
        }else{
            recommendQaList=qaService.findAllQa();
            model.addAttribute("recommendQaList",recommendQaList);
        }


//        有序map  <回答内容，回答对应的评论列表>
        Map<String,List<QaReply>> map=new LinkedHashMap<>();
        List<QaReply> qaReplyList1=new LinkedList<>();
//        遍历问题的回答列表 找到每一个回答下的评论列表
        for(QaReply qaReply:qaReplyList){
            System.out.println("qaReply.getId()"+qaReply.getId());
            List<QaReply> list=qaReplyService.findByqaReplyId(qaReply.getId());
            System.out.println("qaReply.getId()"+list.size());
            if (list.size()==0){
                map.put(qaReply.getContent(),null);
            }else{
                map.put(qaReply.getContent(),list);
            }
//            保持map的顺序与回答的顺序相同
            qaReplyList1.add(qaReply);
        }
        model.addAttribute("map",map);
        model.addAttribute("qaReplyList1",qaReplyList1);
        model.addAttribute("qa",qa);
        model.addAttribute("test","test");
        model.addAttribute("qaReplyList",qaReplyList);
        return "/front/qa/qa_view";
    }


    @GetMapping(value = "/qaList")
    public String getAllCommon(Model model, @RequestParam(name = "s",required = false)String s, @RequestParam(name = "p",required = true)String p,HttpServletRequest request) {
        System.out.println("controller qaRepository.findAll()");
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("userInfo");
//        User user=userService.findByUsername(userName);
        if (user.getUserType()==0){
//            如果是管理员
            List<Qa> qaList = qaService.findAllQa();
            System.out.println("controller qaRepository.findAll().size():"+qaList.size());

            //        取4个字段
            int flag = 4;//每次取的数据
            int size = qaList.size();
            int temp = size / flag + 1;
            boolean special = size % flag == 0;
            List<Qa> cutList = null;
            for (int i = 0; i < temp; i++) {
                if (i == temp - 1) {
                    if (special) {
                        break;
                    }
                    cutList = qaList.subList(flag * i, size);
                } else {
                    cutList = qaList.subList(flag * i, flag * (i + 1));
                }
                if(Integer.parseInt(p)==(i+1)){
                    model.addAttribute("qaList",cutList);
                    break;
                }
                System.out.println("第" + (i + 1) + "组：" + cutList.toString());
            }
            System.out.println(cutList.size());
            model.addAttribute("qaSize",qaList.size());
//            model.addAttribute("qaList",qaList);
        }else if(user.getUserType()==2){
//            如果是讲师
            List<Course> courseList=courseService.findByUserId(user.getId());
//            讲师所对应的总的video
            List<Video> videoList1=new ArrayList<>();
            for (Course c :courseList){
                List<Video> videoList=videoService.findByCourseId(c.getId());
                videoList1.addAll(videoList);
            }
            for (Video video:videoList1){
                List<Qa> qaList=qaService.findByVideo(video);
                model.addAttribute("qaList",qaList);
                //        取4个字段
                int flag = 4;//每次取的数据
                int size = qaList.size();
                int temp = size / flag + 1;
                boolean special = size % flag == 0;
                List<Qa> cutList = null;
                for (int i = 0; i < temp; i++) {
                    if (i == temp - 1) {
                        if (special) {
                            break;
                        }
                        cutList = qaList.subList(flag * i, size);
                    } else {
                        cutList = qaList.subList(flag * i, flag * (i + 1));
                    }
                    if(Integer.parseInt(p)==(i+1)){
                        model.addAttribute("qaList",cutList);
                        break;
                    }
                    System.out.println("第" + (i + 1) + "组：" + cutList.toString());
                }
                System.out.println(cutList.size());
                model.addAttribute("qaSize",qaList.size());
            }
        }else {
            System.out.println("你是普通用户");
        }


        model.addAttribute("current_Page",Integer.parseInt(p));
        return "/admin/qa/qaList";
    }

    @GetMapping("/deleteQa")
    public String deleteQa(@RequestParam("id")Integer id,Model model){
        Qa qa= new Qa();
        qaService.deleteQa(id);
//        attributes.addAttribute("id",chapter.getCourseId());
        return "redirect:/qa/qaList";
    }

    /**
     * 后台查看问题所对应的回答
     * @return
     */
    @GetMapping("/qaReplyList")
    public String viewQaReplyList(@RequestParam(name = "qaId")Integer qaId,@RequestParam(name = "p",required = false)String p,Model model){
        Qa qa=qaService.findById(qaId);
        List<QaReply> qaReplyList=qaReplyService.findByQa(qa);
        Iterator<QaReply> it=qaReplyList.iterator();
        while (it.hasNext()){
            QaReply qaReply=it.next();
            if(qaReply.getQaReplyToPOId()!=null){
                it.remove();
            }
        }
        //        取4个字段
        int flag = 4;//每次取的数据
        int size = qaReplyList.size();
        int temp = size / flag + 1;
        boolean special = size % flag == 0;
        List<QaReply> cutList = null;
        for (int i = 0; i < temp; i++) {
            if (i == temp - 1) {
                if (special) {
                    break;
                }
                cutList = qaReplyList.subList(flag * i, size);
            } else {
                cutList = qaReplyList.subList(flag * i, flag * (i + 1));
            }
            if(Integer.parseInt(p)==(i+1)){
                model.addAttribute("qaReplyList",cutList);
                break;
            }
            System.out.println("第" + (i + 1) + "组：" + cutList.toString());
        }
        System.out.println(cutList.size());

        model.addAttribute("qa",qa);
//        model.addAttribute("qaReplyList",qaReplyList);
        model.addAttribute("qaReplySize",qaReplyList.size());
        model.addAttribute("current_Page",Integer.parseInt(p));
        return "admin/qa/qaReplyList";
    }

    @GetMapping("/deleteQaReply")
    public String deleteQaReply(@RequestParam("qaReplyId")Integer qaReplyId,Model model){
        QaReply qaReply=qaReplyService.findById(qaReplyId);
        Qa qa=qaReply.getQa();
        qa.setAnswers(qa.getAnswers()-1);
//        redirectAttributes.addFlashAttribute("qaId",qaReply.getQa().getId());
        qaReplyService.deleteQaReply(qaReplyId);
        return "redirect:/qa/qaReplyList?qaId="+qaReply.getQa().getId();
    }

    @GetMapping("/answerReplyList")
    public String viewAnswerReplyList(@RequestParam(name = "qaReplyId")Integer qaReplyId,@RequestParam(name = "p",required = false)String p,Model model){
        List<QaReply> qaReplyList=qaReplyService.findByqaReplyToPOId(qaReplyId);
//        取4个字段
        int flag = 4;//每次取的数据

        int size = qaReplyList.size();
        int temp = size / flag + 1;
        boolean special = size % flag == 0;
        List<QaReply> cutList = null;
        for (int i = 0; i < temp; i++) {
            if (i == temp - 1) {
                if (special) {
                    break;
                }
                cutList = qaReplyList.subList(flag * i, size);
            } else {
                cutList = qaReplyList.subList(flag * i, flag * (i + 1));
            }
            if(Integer.parseInt(p)==(i+1)){
                model.addAttribute("answerReplyList",cutList);
                break;
            }
//            System.out.println("第" + (i + 1) + "组：" + cutList.toString());
        }
        System.out.println(cutList.size());
        model.addAttribute("qaReplyId",qaReplyId);
        System.out.println("qaReplyId::::::::"+qaReplyId);
        model.addAttribute("qaReplyAnswerSize",qaReplyList.size());
        model.addAttribute("current_Page",Integer.parseInt(p));
        return "admin/qa/qaAnswerReplyList";
    }

    @GetMapping("/deleteQaAnswerReply")
    public String deleteQaAnswerReply(@RequestParam(name = "qaReplyId")Integer qaReplyId,Model model){
        QaReply qaReply=qaReplyService.findById(qaReplyId);
        QaReply qaReply1=qaReplyService.findById(qaReply.getQaReplyToPOId());
        qaReply1.setAnswers(qaReply1.getAnswers()-1);
        qaReplyService.deleteQaReply(qaReplyId);
        return "redirect:/qa/answerReplyList?qaReplyId="+qaReply.getQa().getId();
    }

}
