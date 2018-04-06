package com.sxdubbo.learn.service.impl;

import com.fasterxml.jackson.databind.util.BeanUtil;
import com.sxdubbo.learn.domain.CoursePO;
import com.sxdubbo.learn.domain.CourseScorePO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubbo.learn.repository.CourseScoreRepository;
import com.sxdubbo.learn.utils.BeanTransferCourseScore;
import com.sxdubboapi.learn.domain.Course;
import com.sxdubboapi.learn.domain.CourseScore;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.service.CourseScoreService;
import jdk.nashorn.internal.runtime.linker.LinkerCallSite;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ScopeMetadataResolver;

import java.util.LinkedList;
import java.util.List;

public class CourseScoreServiceImp implements CourseScoreService {
    @Autowired
    public CourseScoreRepository courseScoreRepository;

    @Override
    public CourseScore addScore(CourseScore courseScore){
        UserPO userPO=new UserPO();
        CoursePO coursePO=new CoursePO();
        BeanUtils.copyProperties(courseScore.getUser(),userPO);
        BeanUtils.copyProperties(courseScore.getCourse(),coursePO);
        CourseScorePO courseScorePO=new CourseScorePO();
        courseScorePO.setId(courseScore.getId());
        courseScorePO.setUserPO(userPO);
        courseScorePO.setCoursePO(coursePO);
        courseScorePO.setScore(courseScore.getScore());
        courseScoreRepository.save(courseScorePO);
        return courseScore;
    }

    @Override
    public List<CourseScore> findByUser(User user){
        UserPO userPO=new UserPO();
        BeanUtils.copyProperties(user,userPO);
        List<CourseScorePO> courseScorePOList=courseScoreRepository.findByUserPO(userPO);
        List<CourseScore> courseScoreList=new LinkedList<>();
        for (CourseScorePO courseScorePO:courseScorePOList){
            CourseScore courseScore=new CourseScore();
            User user1=new User();
            Course course=new Course();
            BeanUtils.copyProperties(courseScorePO,courseScore);
            BeanUtils.copyProperties(courseScorePO.getUserPO(),user1);
            BeanUtils.copyProperties(courseScorePO.getCoursePO(),course);
            courseScore.setUser(user);
            courseScore.setCourse(course);
            courseScore.setScore(courseScorePO.getScore());
            courseScoreList.add(courseScore);
        }
        return courseScoreList;
    }

    @Override
    public List<CourseScore> findAll(){
        List<CourseScorePO> courseScorePOList=courseScoreRepository.findAll();
        List<CourseScore> courseScoreList=new LinkedList<>();
        for (CourseScorePO courseScorePO:courseScorePOList){
            CourseScore courseScore=new CourseScore();
            Course course=new Course();
            User user=new User();
            BeanUtils.copyProperties(courseScorePO.getCoursePO(),course);
            BeanUtils.copyProperties(courseScorePO.getUserPO(),user);
            courseScore.setUser(user);
            courseScore.setCourse(course);
            courseScore.setScore(courseScorePO.getScore());
            courseScoreList.add(courseScore);
        }
        return courseScoreList;
    }

    @Override
    public CourseScore findByCourseAndUser(Course course,User user){
        CoursePO coursePO=new CoursePO();
        UserPO userPO=new UserPO();
        CourseScore courseScore=new CourseScore();
        BeanUtils.copyProperties(course,coursePO);
        BeanUtils.copyProperties(user,userPO);
        CourseScorePO courseScorePO=courseScoreRepository.findByCoursePOAndUserPO(coursePO,userPO);
        if(courseScorePO!=null){
            BeanTransferCourseScore.transferCourseScore(courseScorePO,courseScore);
        }
        return courseScore;
    }

    @Override
    public List<CourseScore> findByCourse(Course course){
        CoursePO coursePO=new CoursePO();
        BeanUtils.copyProperties(course,coursePO);
        List<CourseScorePO> courseScorePOList=courseScoreRepository.findByCoursePO(coursePO);
        List<CourseScore> courseScores=new LinkedList<>();
        if(courseScorePOList!=null){
            for (int i=0;i<courseScorePOList.size();i++){
                CourseScore courseScore=new CourseScore();
                User user=new User();
                Course course1=new Course();
                BeanUtils.copyProperties(courseScorePOList.get(i).getCoursePO(),course1);
                BeanUtils.copyProperties(courseScorePOList.get(i).getUserPO(),user);
                BeanUtils.copyProperties(courseScorePOList.get(i),courseScore);
                courseScore.setCourse(course);
                courseScore.setUser(user);
                courseScores.add(courseScore);
            }
        }
        return courseScores;
    }
}
