package com.sxdubbo.learn.utils;


import com.sxdubbo.learn.domain.UserPO;
import com.sxdubbo.learn.domain.FollowPO;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.domain.Follow;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-06 11:15.
 **/
public class BeanTransferFollow {

    public static List<Follow> transferFollowList(List<FollowPO> followPOList,List<Follow> followList){
        for(int i = 0 ; i < followPOList.size() ; i++) {
            Follow follow = new Follow();
            User user2 = new User();
            User user1 = new User();
            BeanUtils.copyProperties(followPOList.get(i).getUserPO1(),user1);
            BeanUtils.copyProperties(followPOList.get(i).getUserPO2(),user2);
            System.out.println("testpaper");
            BeanUtils.copyProperties(followPOList.get(i), follow);
            follow.setUser1(user1);
            follow.setUser2(user2);
            followList.add(follow);
        }
        return followList;
    }

    public static FollowPO transferFollow(Follow follow,FollowPO followPO){
        UserPO userPO2 = new UserPO();
        UserPO userPO1 = new UserPO();
        BeanUtils.copyProperties(follow.getUser1(),userPO1);
        BeanUtils.copyProperties(follow.getUser2(),userPO2);
        BeanUtils.copyProperties(follow, followPO);
        followPO.setUserPO1(userPO1);
        followPO.setUserPO2(userPO2);
        return followPO;
    }
    public static Follow transferFollow(FollowPO followPO,Follow follow){
        User user2 = new User();
        User user1 = new User();
        BeanUtils.copyProperties(followPO.getUserPO1(),user1);
        BeanUtils.copyProperties(followPO.getUserPO2(),user2);
        BeanUtils.copyProperties(followPO, follow);
        follow.setUser1(user1);
        follow.setUser2(user2);
        return follow;
    }
}
