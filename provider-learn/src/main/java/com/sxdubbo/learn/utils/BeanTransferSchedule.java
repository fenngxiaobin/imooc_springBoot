package com.sxdubbo.learn.utils;

import com.sxdubbo.learn.domain.SchedulePO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubboapi.learn.domain.Schedule;
import com.sxdubboapi.learn.domain.User;
import org.springframework.beans.BeanUtils;

import java.util.List;

public class BeanTransferSchedule {
    public static List<Schedule> transferScheduleList(List<SchedulePO> schedulePOList, List<Schedule> scheduleList){
        for(int i = 0 ; i < schedulePOList.size() ; i++) {
            Schedule schedule=new Schedule();
            User user = new User();
            BeanUtils.copyProperties(schedulePOList.get(i).getUserPO(),user);
            BeanUtils.copyProperties(schedulePOList.get(i), schedule);
            schedule.setUser(user);
            scheduleList.add(schedule);
        }
        return scheduleList;
    }
    public static SchedulePO transferSchedule(Schedule schedule,SchedulePO schedulePO){
        UserPO userPO=new UserPO();
        BeanUtils.copyProperties(schedule.getUser(),userPO);
        BeanUtils.copyProperties(schedule,schedulePO);
        schedulePO.setUserPO(userPO);
        return schedulePO;
    }
    public static Schedule transferSchedule(SchedulePO schedulePO,Schedule schedule){
        User user=new User();
        BeanUtils.copyProperties(schedulePO.getUserPO(),user);
        BeanUtils.copyProperties(schedulePO,schedule);
        schedule.setUser(user);
        return schedule;
    }
}
