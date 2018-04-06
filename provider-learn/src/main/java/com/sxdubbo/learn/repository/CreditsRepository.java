package com.sxdubbo.learn.repository;

import com.sxdubbo.learn.domain.CreditsPO;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * created by  luwei
 * 2018-03-18 19:10.
 **/
public interface CreditsRepository extends JpaRepository<CreditsPO,Integer> {
    public CreditsPO findByUserPO_Id(Integer userId);
}
