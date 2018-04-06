package com.sxdubboapi.learn.service;


import com.sxdubboapi.learn.domain.Course;
import com.sxdubboapi.learn.domain.CourseScore;
import com.sxdubboapi.learn.domain.User;

import java.util.List;

public interface CourseScoreService {
    public CourseScore addScore(CourseScore courseScore);
    public List<CourseScore> findByUser(User user);
    public List<CourseScore> findAll();
    public CourseScore findByCourseAndUser(Course course, User user);
//    public List<CourseScore> findByCourse();
    public List<CourseScore> findByCourse(Course course);
}
