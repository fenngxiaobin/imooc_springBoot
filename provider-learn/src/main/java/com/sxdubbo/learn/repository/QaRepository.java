package com.sxdubbo.learn.repository;

import com.sxdubbo.learn.domain.QaPO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubbo.learn.domain.VideoPO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by fxb on 18-3-8.
 */
public interface QaRepository extends JpaRepository<QaPO,Integer>{
    public List<QaPO> findByVideoPO(VideoPO videoPO);
    public QaPO findById(Integer id);
    public List<QaPO> findByUserPO(UserPO userPO);
//    public QaPO save(QaPO qaPO);
//    public List<QaPO> findAll();
    public List<QaPO> findByLabel(String label);
}
