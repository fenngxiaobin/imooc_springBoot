package com.sxdubbo.learn.repository;

import com.sxdubbo.learn.domain.CoursePO;
import com.sxdubbo.learn.domain.CourseScorePO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubboapi.learn.domain.CourseScore;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CourseScoreRepository extends JpaRepository<CourseScorePO,Integer>{
    public List<CourseScorePO> findByUserPO(UserPO userPO);
    public List<CourseScorePO> findByCoursePO(CoursePO coursePO);
    public CourseScorePO findByCoursePOAndUserPO(CoursePO coursePO,UserPO userPO);
}
