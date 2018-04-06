package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.SchedulePO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubbo.learn.repository.ScheduleRepository;
import com.sxdubbo.learn.utils.BeanTransferSchedule;
import com.sxdubbo.learn.utils.BeanTransferUserTest;
import com.sxdubboapi.learn.domain.Schedule;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.service.ScheduleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

public class ScheduleServiceImpl implements ScheduleService{
    @Autowired
    public ScheduleRepository scheduleRepository;

    @Override
    public List<Schedule> findByUser(User user){
        List<Schedule> scheduleList=new ArrayList<>();
        UserPO userPO = new UserPO();
        BeanUtils.copyProperties(user,userPO);
        List<SchedulePO> schedulePOList=scheduleRepository.findByUserPO(userPO);
        BeanTransferSchedule.transferScheduleList(schedulePOList,scheduleList);
        return scheduleList;
    }
    @Transactional
    @Override
    public Schedule addSchedule(Schedule schedule){
        SchedulePO schedulePO=new SchedulePO();
        BeanTransferSchedule.transferSchedule(schedule,schedulePO);
        scheduleRepository.save(schedulePO);
        return schedule;
    }
    @Override
    public void deleteSchedule(Integer id){
        SchedulePO schedulePO=scheduleRepository.findById(id);
        scheduleRepository.delete(schedulePO);
    }
}
