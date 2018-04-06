package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.HeadFramePO;
import com.sxdubbo.learn.repository.HeadFrameRepository;
import com.sxdubbo.learn.repository.UserHeadFrameRepository;
import com.sxdubboapi.learn.domain.HeadFrame;
import com.sxdubboapi.learn.service.HeadFrameService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * created by  luwei
 * 2018-03-18 19:23.
 **/
public class HeadFrameServiceImpl implements HeadFrameService{
    @Autowired
    public HeadFrameRepository headFrameRepository;
    @Autowired
    public UserHeadFrameRepository userHeadFrameRepository;

    @Override
    public HeadFrame addHeadFrame(HeadFrame headFrame){
        HeadFramePO headFramePO = new HeadFramePO();
        BeanUtils.copyProperties(headFrame,headFramePO);
        headFrameRepository.save(headFramePO);
        return headFrame;
    }
    @Override
    public HeadFrame updateHeadFrame(HeadFrame headFrame){
        HeadFramePO headFramePO = new HeadFramePO();
        BeanUtils.copyProperties(headFrame,headFramePO);
        headFrameRepository.save(headFramePO);
        return headFrame;
    }
    @Override
    public void deleteHeadFrame(Integer id){
//        HeadFramePO headFramePO = headFrameRepository.getOne(id);
//        userHeadFrameRepository.delete();
        headFrameRepository.delete(id);

    }

    @Override
    public List<HeadFrame> findAllHeadFrame(){
        List<HeadFrame> headFrameList = new ArrayList<>();
        List<HeadFramePO> headFramePOList = headFrameRepository.findAll();
        for(int i = 0;i<headFramePOList.size();i++){
            HeadFrame headFrame = new HeadFrame();
            BeanUtils.copyProperties(headFramePOList.get(i),headFrame);
            headFrameList.add(headFrame);
        }
        return headFrameList;
    }
    @Override
    public HeadFrame findById(Integer id){
        HeadFrame headFrame = new HeadFrame();
        HeadFramePO headFramePO = headFrameRepository.findOne(id);
        BeanUtils.copyProperties(headFramePO,headFrame);
        return  headFrame;
    }
}
