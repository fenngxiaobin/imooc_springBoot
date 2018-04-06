package com.sxdubbo.learn.controller;

import com.sxdubbo.learn.utils.FileUtils;
import com.sxdubboapi.learn.domain.HeadFrame;
import com.sxdubboapi.learn.domain.UserHeadFrame;
import com.sxdubboapi.learn.service.HeadFrameService;
import com.sxdubboapi.learn.service.UserHeadFrameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

/**
 * created by  luwei
 * 2018-03-18 19:52.
 **/
@Controller
@RequestMapping("/headFrame")
public class HeadFrameController {
    @Autowired
    public HeadFrameService headFrameService;
    @Autowired
    public UserHeadFrameService userHeadFrameService;

    @Value("${web.upload-path}")
    private String filePath;

    @GetMapping("/listHeadFrame")
    public String listHeadFrame(Model model){
        List<HeadFrame> headFrameList = headFrameService.findAllHeadFrame();
        model.addAttribute("headFrameList",headFrameList);
        return "/admin/head/head_frame_list";
    }
    @GetMapping("/mall")
    public String mall(Model model){
        List<HeadFrame> headFrameList = headFrameService.findAllHeadFrame();
        List<UserHeadFrame> userHeadFrameList = userHeadFrameService.findAllUserHeadFrame();
        model.addAttribute("headFrameList",headFrameList);
        model.addAttribute("userHeadFrameList",userHeadFrameList);
        return "/front/mall/mall";
    }
    @RequestMapping("/mallView")
    public String mallView(Model model,@RequestParam("id") Integer id){
        HeadFrame headFrame = headFrameService.findById(id);
        List<UserHeadFrame> userHeadFrameList = userHeadFrameService.findAllUserHeadFrame();
        model.addAttribute("headFrame",headFrame);
        model.addAttribute("userHeadFrameList",userHeadFrameList);
        return "/front/mall/head_view";
    }
    @PostMapping("/addHeadFrame")
    public String addHeadFrame(@Valid HeadFrame headFrame, BindingResult bindingResult, HttpServletRequest request,
                               @RequestParam(value="filePath") MultipartFile file, RedirectAttributes attributes){

        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
//            String filePath1 = ClassUtils.getDefaultClassLoader().getResource("static/admin/").getPath();
            String filePath1 = filePath+"uploadHead/";
            try {
                filePath1 = URLDecoder.decode(filePath1, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            String file_name = System.currentTimeMillis() + suffixName;
//            String filePath  = filePath1+"uploadHead/";
            File dest = new File(filePath1);
            // 检测是否存在目录
            if (!dest.exists()) {
                dest.mkdirs();// 新建文件夹
            }
            try {
                FileUtils.uploadFile(file.getBytes(), filePath1, file_name);
            } catch (Exception e) {
                // TODO: handle exception
            }
            headFrame.setFilePath(file_name);
        }
        headFrame.setCreateDate(new Date());
        headFrame.setModifyDate(new Date());
        HeadFrame headFrame1 = headFrameService.addHeadFrame(headFrame);
        return "redirect:/headFrame/listHeadFrame";
    }
    @PostMapping("/updateHeadFrame")
    public String updateHeadFrame(@Valid HeadFrame headFrame, BindingResult bindingResult, HttpServletRequest request,
                                  @RequestParam(value="filePath") MultipartFile file, RedirectAttributes attributes){
        HeadFrame headFrame1 = headFrameService.findById(headFrame.getId());
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
//            String filePath1 = ClassUtils.getDefaultClassLoader().getResource("static/admin/").getPath();
//            System.out.println("updateHeadFrame");
            String filePath1 = filePath +"uploadHead/";
            try {
                filePath1 = URLDecoder.decode(filePath1, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            System.out.println("");
            String file_name = System.currentTimeMillis() + suffixName;
            File dest = new File(filePath1);
            // 检测是否存在目录
            if (!dest.exists()) {
                dest.mkdirs();// 新建文件夹
            }
            try {
                FileUtils.uploadFile(file.getBytes(), filePath1, file_name);
            } catch (Exception e) {
                // TODO: handle exception
            }
            headFrame.setFilePath(file_name);
        }else{
            headFrame.setFilePath(headFrame1.getFilePath());
        }
        headFrame.setCreateDate(headFrame1.getCreateDate());
        headFrame.setModifyDate(new Date());
        HeadFrame headFrame2 = headFrameService.updateHeadFrame(headFrame);
        return "redirect:/headFrame/listHeadFrame";
    }

    @GetMapping("/deleteHeadFrame")
    public String deleteHeadFrame(@RequestParam("id") Integer id,RedirectAttributes attributes){
        headFrameService.deleteHeadFrame(id);
        return "redirect:/headFrame/listHeadFrame";
    }
}
