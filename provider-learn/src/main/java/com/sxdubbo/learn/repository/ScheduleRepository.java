package com.sxdubbo.learn.repository;

import com.sxdubbo.learn.domain.SchedulePO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubboapi.learn.domain.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ScheduleRepository extends JpaRepository<SchedulePO,Integer>{
    public List<SchedulePO> findByUserPO(UserPO userPO);
    public SchedulePO findById(Integer id);
}
