package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.UserCoursePO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubbo.learn.repository.UserCourseRepository;
import com.sxdubbo.learn.utils.BeanTransferUserCourse;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.domain.UserCourse;
import com.sxdubboapi.learn.service.UserCourseService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * created by  luwei
 * 2018-01-22 19:39.
 **/
public class UserCourseServiceImpl implements UserCourseService {

    @Autowired
    public UserCourseRepository userCourseRepository;

    @Override
    public List<UserCourse> findByUserId(Integer userId) {

        List<UserCourse> userCourseList = new ArrayList<>();
        List<UserCoursePO> userCoursePOList = userCourseRepository.findByUserPO_Id(userId);
        if(userCoursePOList != null){
            BeanTransferUserCourse.transferUserCourseList(userCoursePOList,userCourseList);
            return userCourseList;
        }else{
            return null;
        }
    }

    @Override
    public List<UserCourse> findByCourseId(Integer courseId){
        List<UserCourse> userCourseList = new ArrayList<>();
        List<UserCoursePO> userCoursePOList = userCourseRepository.findByCoursePO_Id(courseId);
        if(userCoursePOList != null){
            BeanTransferUserCourse.transferUserCourseList(userCoursePOList,userCourseList);
            return userCourseList;
        }else{
            return null;
        }
    }

    @Override
    public UserCourse addUserCourse(UserCourse userCourse){
        UserCoursePO userCoursePO = new UserCoursePO();
        UserCourse userCourse1=new UserCourse();
        BeanTransferUserCourse.transferUserCourse(userCourse,userCoursePO);
        UserCoursePO userCoursePO1 = userCourseRepository.save(userCoursePO);
        BeanTransferUserCourse.transferUserCourse(userCoursePO1,userCourse1);
        return userCourse1;
    }
    @Override
    public UserCourse updateUserCourse(UserCourse userCourse){
        UserCoursePO userCoursePO = new UserCoursePO();
        UserCourse userCourse1=new UserCourse();
        System.out.println("update");
        BeanTransferUserCourse.transferUserCourse(userCourse,userCoursePO);
        UserCoursePO userCoursePO1 = userCourseRepository.save(userCoursePO);
        BeanTransferUserCourse.transferUserCourse(userCoursePO1,userCourse1);
        return userCourse1;
    }

    @Override
    public UserCourse findByUserIdAndCourseId(Integer userId,Integer courseId){
        UserCourse userCourse = new UserCourse();
        UserCoursePO userCoursePO = userCourseRepository.findByUserPO_IdAndCoursePO_Id(userId,courseId);
        if(userCoursePO !=null){
            BeanTransferUserCourse.transferUserCourse(userCoursePO,userCourse);
            return userCourse;
        }else{
            return null;
        }
    }

    @Override
    public UserCourse findByUserIdAndVideoId(Integer userId,Integer videoId){
        UserCourse userCourse = new UserCourse();
        UserCoursePO userCoursePO = userCourseRepository.findByUserPO_IdAndVideoPO_Id(userId,videoId);
        if(userCoursePO !=null){
            BeanTransferUserCourse.transferUserCourse(userCoursePO,userCourse);
            return userCourse;
        }else{
            return null;
        }
    }
}
