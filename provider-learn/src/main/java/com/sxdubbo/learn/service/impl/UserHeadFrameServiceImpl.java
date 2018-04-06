package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.UserHeadFramePO;
import com.sxdubbo.learn.repository.UserHeadFrameRepository;
import com.sxdubbo.learn.utils.BeanTransferUserHeadFrame;
import com.sxdubboapi.learn.domain.UserHeadFrame;
import com.sxdubboapi.learn.service.UserHeadFrameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import java.util.ArrayList;
import java.util.List;

/**
 * created by  luwei
 * 2018-03-18 19:33.
 **/
public class UserHeadFrameServiceImpl implements UserHeadFrameService{
    @Autowired
    public UserHeadFrameRepository userHeadFrameRepository;

    @Override
    public UserHeadFrame addUserHeadFrame(UserHeadFrame userHeadFrame){
        UserHeadFramePO userHeadFramePO = new UserHeadFramePO();
        BeanTransferUserHeadFrame.transferUserHeadFrame(userHeadFrame,userHeadFramePO);
        userHeadFrameRepository.save(userHeadFramePO);
        return userHeadFrame;
    }

    @Override
    public UserHeadFrame updateUserHeadFrame(UserHeadFrame userHeadFrame){
        UserHeadFramePO userHeadFramePO = new UserHeadFramePO();
        BeanTransferUserHeadFrame.transferUserHeadFrame(userHeadFrame,userHeadFramePO);
        userHeadFrameRepository.save(userHeadFramePO);
        return userHeadFrame;
    }

    @Override
    public void deleteUserHeadFrame(Integer id){
        userHeadFrameRepository.delete(id);
    }

    @Override
    public UserHeadFrame findByUserIdAndChoice(Integer userId,Integer choice){
        UserHeadFrame userHeadFrame = new UserHeadFrame();
        UserHeadFramePO userHeadFramePO = userHeadFrameRepository.findByUserPO_IdAndChoice(userId,choice);
        if(userHeadFramePO != null){
            BeanTransferUserHeadFrame.transferUserHeadFrame(userHeadFramePO,userHeadFrame);
            return userHeadFrame;
        }else{
            return null;
        }
    }
    @Override
    public List<UserHeadFrame> findByUserId(Integer userId){
        List<UserHeadFrame> userHeadFrameList = new ArrayList<>();
        List<UserHeadFramePO> userHeadFramePOList = userHeadFrameRepository.findByUserPO_Id(userId);
        if(userHeadFramePOList != null){
            BeanTransferUserHeadFrame.transferUserHeadFrameList(userHeadFramePOList,userHeadFrameList);
            return userHeadFrameList;
        }else{
            return null;
        }
    }

    @Override
    public List<UserHeadFrame> findAllUserHeadFrame(){
        List<UserHeadFrame> userHeadFrameList = new ArrayList<>();
        List<UserHeadFramePO> userHeadFramePOList = userHeadFrameRepository.findAll();
        if(userHeadFramePOList != null){
            BeanTransferUserHeadFrame.transferUserHeadFrameList(userHeadFramePOList,userHeadFrameList);
            return userHeadFrameList;
        }else{
            return null;
        }
    }
    @Override
    public UserHeadFrame findByUserIdAndHeadFrameId(Integer userId,Integer headFrameId){
        UserHeadFrame userHeadFrame = new UserHeadFrame();
        UserHeadFramePO userHeadFramePO = userHeadFrameRepository.findByUserPO_IdAndHeadFramePO_Id(userId,headFrameId);
        if(userHeadFramePO != null){
            BeanTransferUserHeadFrame.transferUserHeadFrame(userHeadFramePO,userHeadFrame);
            return userHeadFrame;
        }else{
            return null;
        }
    }
}
