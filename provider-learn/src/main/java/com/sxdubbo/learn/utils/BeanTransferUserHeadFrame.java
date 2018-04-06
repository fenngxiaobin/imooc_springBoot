package com.sxdubbo.learn.utils;

import com.sxdubbo.learn.domain.*;
import com.sxdubboapi.learn.domain.*;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-06 11:15.
 **/
public class BeanTransferUserHeadFrame {

    public static List<UserHeadFrame> transferUserHeadFrameList(List<UserHeadFramePO> userHeadFramePOList,List<UserHeadFrame> userHeadFrameList){
        for(int i = 0 ; i < userHeadFramePOList.size() ; i++) {
            UserHeadFrame userHeadFrame = new UserHeadFrame();
            User user = new User();
            HeadFrame headFrame = new HeadFrame();
            BeanUtils.copyProperties(userHeadFramePOList.get(i).getUserPO(),user);
            BeanUtils.copyProperties(userHeadFramePOList.get(i).getHeadFramePO(),headFrame);
            System.out.println("userHeadFrame");
            BeanUtils.copyProperties(userHeadFramePOList.get(i), userHeadFrame);
            userHeadFrame.setUser(user);
            userHeadFrame.setHeadFrame(headFrame);
            userHeadFrameList.add(userHeadFrame);
        }
        return userHeadFrameList;
    }

    public static UserHeadFramePO transferUserHeadFrame(UserHeadFrame userHeadFrame,UserHeadFramePO userHeadFramePO){
        UserPO userPO = new UserPO();
        HeadFramePO headFramePO = new HeadFramePO();
        BeanUtils.copyProperties(userHeadFrame.getUser(),userPO);
        BeanUtils.copyProperties(userHeadFrame.getHeadFrame(),headFramePO);
        BeanUtils.copyProperties(userHeadFrame, userHeadFramePO);
        System.out.println("userHeadFrame");
        userHeadFramePO.setUserPO(userPO);
        userHeadFramePO.setHeadFramePO(headFramePO);;
        return userHeadFramePO;
    }
    public static UserHeadFrame transferUserHeadFrame(UserHeadFramePO userHeadFramePO,UserHeadFrame userHeadFrame){
        User user = new User();
        HeadFrame headFrame = new HeadFrame();
        BeanUtils.copyProperties(userHeadFramePO.getUserPO(),user);
        BeanUtils.copyProperties(userHeadFramePO.getHeadFramePO(),headFrame);
        BeanUtils.copyProperties(userHeadFramePO, userHeadFrame);
        System.out.println("testpaper");
        userHeadFrame.setUser(user);
        userHeadFrame.setHeadFrame(headFrame);
        return userHeadFrame;
    }
}
