package com.sxdubbo.learn.utils;

import com.sxdubbo.learn.domain.CoursePO;
import com.sxdubbo.learn.domain.CourseScorePO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubboapi.learn.domain.Course;
import com.sxdubboapi.learn.domain.CourseScore;
import com.sxdubboapi.learn.domain.User;
import org.springframework.beans.BeanUtils;

/**
 * created by  luwei
 * 2018-03-28 18:34.
 **/
public class BeanTransferCourseScore {
    public static CourseScore transferCourseScore(CourseScorePO courseScorePO,CourseScore courseScore){
        User user = new User();
        Course course = new Course();
        BeanUtils.copyProperties(courseScorePO.getUserPO(),user);
        BeanUtils.copyProperties(courseScorePO.getCoursePO(),course);
        BeanUtils.copyProperties(courseScorePO,courseScore);
        courseScore.setCourse(course);
        courseScore.setUser(user);
        return courseScore;
    }
    public static CourseScorePO transferCourseScore(CourseScore courseScore,CourseScorePO courseScorePO){
        UserPO userPO = new UserPO();
        CoursePO coursePO = new CoursePO();
        BeanUtils.copyProperties(courseScore.getUser(),userPO);
        BeanUtils.copyProperties(courseScore.getCourse(),coursePO);
        BeanUtils.copyProperties(courseScore,courseScorePO);
        courseScorePO.setCoursePO(coursePO);
        courseScorePO.setUserPO(userPO);
        return courseScorePO;
    }
}
