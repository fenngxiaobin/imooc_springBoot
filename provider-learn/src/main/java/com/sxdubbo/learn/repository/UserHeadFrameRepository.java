package com.sxdubbo.learn.repository;

import com.sxdubbo.learn.domain.UserHeadFramePO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-18 19:12.
 **/
public interface UserHeadFrameRepository extends JpaRepository<UserHeadFramePO,Integer> {
    public List<UserHeadFramePO> findByUserPO_Id(Integer userId);

    public UserHeadFramePO findByUserPO_IdAndChoice(Integer userId,Integer choice);

    public UserHeadFramePO findByUserPO_IdAndHeadFramePO_Id(Integer userId,Integer headFrameId);
}
