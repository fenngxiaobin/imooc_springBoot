package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.FollowPO;
import com.sxdubbo.learn.repository.FollowRepository;
import com.sxdubbo.learn.utils.BeanTransferFollow;
import com.sxdubboapi.learn.domain.Follow;
import com.sxdubboapi.learn.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * created by  luwei
 * 2018-03-18 16:11.
 **/
public class FollowServiceImpl implements FollowService {
    @Autowired
    public FollowRepository followRepository;

    @Override
    public List<Follow> findByUser1_id(Integer user1Id){
        List<Follow> followList = new ArrayList<>();
        List<FollowPO> followPOList = followRepository.findByUserPO1_Id(user1Id);
        if(followPOList != null){
            BeanTransferFollow.transferFollowList(followPOList,followList);
            return followList;
        }else {
            return null;
        }
    }

    @Override
    public List<Follow> findByUser2_id(Integer user2Id){
        List<Follow> followList = new ArrayList<>();
        List<FollowPO> followPOList = followRepository.findByUserPO2_Id(user2Id);
        if(followPOList != null){
            BeanTransferFollow.transferFollowList(followPOList,followList);
            return followList;
        }else {
            return null;
        }
    }

    @Override
    public Follow addFollow(Follow follow){
        FollowPO followPO = new FollowPO();
        BeanTransferFollow.transferFollow(follow,followPO);
        followRepository.save(followPO);
        return follow;
    }

    @Override
    public void deleteFollow(Integer id){
        followRepository.delete(id);
    }

    @Override
    public Integer countByUser1_id(Integer user1Id){
        return followRepository.countByUserPO1_Id(user1Id);
    }

    @Override
    public Integer countByUser2_id(Integer user2Id){
        return followRepository.countByUserPO2_Id(user2Id);
    }


    @Override
    public Follow findByUser1AndUser2(Integer user1,Integer user2){
        FollowPO followPO = followRepository.findByUserPO1_IdAndUserPO2_Id(user1,user2);
        Follow follow = new Follow();
        BeanTransferFollow.transferFollow(followPO,follow);
        return follow;
    }
}
