package com.sxdubboapi.learn.service;

import com.sxdubboapi.learn.domain.UserCourse;

import java.util.List;

/**
 * created by  luwei
 * 2018-01-22 19:27.
 **/
public interface UserCourseService {

    public List<UserCourse> findByUserId(Integer userId);
    public List<UserCourse> findByCourseId(Integer courseId);
    public UserCourse addUserCourse(UserCourse userCourse);
    public UserCourse updateUserCourse(UserCourse userCourse);
    public UserCourse findByUserIdAndCourseId(Integer userId,Integer courseId);
    public UserCourse findByUserIdAndVideoId(Integer userId,Integer videoId);
}
