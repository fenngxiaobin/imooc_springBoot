package com.sxdubbo.learn.controller;

import com.sxdubboapi.learn.domain.BulletScreen;
import com.sxdubboapi.learn.service.BulletScreenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-22 13:57.
 **/
@Controller
@ResponseBody
@RequestMapping("/bullet")
public class BulletScreenController {
    @Autowired
    public BulletScreenService bulletScreenService;

    @RequestMapping("/addBulletScreen")
    public String addBulletScreen(@RequestParam("danmu") String danmu,@RequestParam("videoId") Integer videoId){
        System.out.println("danmu is *****************************"+danmu);
        System.out.println("video"+videoId);
        BulletScreen bulletScreen = new BulletScreen();
        bulletScreen.setVideoId(videoId);
        bulletScreen.setDanmu(danmu);
        bulletScreenService.addBulletScreen(bulletScreen);
        return danmu;
    }
    @RequestMapping("/findByVideoId")
    public String findByVideoId(@RequestParam("videoId")Integer videoId){
        List<BulletScreen> bulletScreenList = bulletScreenService.findByVideoId(videoId);
        String danmu = "[";
        int first=0;
        for(int i = 0;i<bulletScreenList.size();i++){
            if(first == 1){
                danmu = danmu + ",";
            }
            first =1;
            danmu = danmu +"'"+bulletScreenList.get(i).getDanmu()+"'";
        }
        danmu = danmu +"]";
        return danmu;
    }
}
