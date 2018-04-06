package com.sxdubbo.learn.repository;

import com.sxdubbo.learn.domain.FollowPO;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

/**
 * created by  luwei
 * 2018-03-18 16:08.
 **/
public interface FollowRepository extends JpaRepository<FollowPO,Integer> {

    public List<FollowPO> findByUserPO1_Id(Integer user1Id);

    public List<FollowPO> findByUserPO2_Id(Integer user2Id);

    public Integer countByUserPO1_Id(Integer user1Id);

    public Integer countByUserPO2_Id(Integer user2Id);

    public FollowPO findByUserPO1_IdAndUserPO2_Id(Integer user1,Integer user2);
}
