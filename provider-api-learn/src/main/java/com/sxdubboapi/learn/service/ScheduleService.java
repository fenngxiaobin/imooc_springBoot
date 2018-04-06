package com.sxdubboapi.learn.service;

import com.sxdubboapi.learn.domain.Schedule;
import com.sxdubboapi.learn.domain.User;

import java.util.List;

public interface ScheduleService {
    public List<Schedule> findByUser(User user);
    public Schedule addSchedule(Schedule schedule);
    public void deleteSchedule(Integer id);
}
