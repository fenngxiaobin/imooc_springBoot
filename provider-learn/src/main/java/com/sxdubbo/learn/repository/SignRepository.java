package com.sxdubbo.learn.repository;

import com.sxdubbo.learn.domain.SignPO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-19 13:44.
 **/
public interface SignRepository extends JpaRepository<SignPO,Integer> {
    public List<SignPO> findByUserId(Integer userId);
}
