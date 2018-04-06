package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.SignPO;
import com.sxdubbo.learn.repository.SignRepository;
import com.sxdubboapi.learn.domain.Sign;
import com.sxdubboapi.learn.service.SignService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * created by  luwei
 * 2018-03-19 13:45.
 **/
public class SignServiceImpl implements SignService{
    @Autowired
    public SignRepository signRepository;

    @Override
    public List<Sign> findByUserId(Integer userId){
        List<Sign> signList = new ArrayList<>();
        List<SignPO> signPOList = signRepository.findByUserId(userId);
        if(signPOList != null){
            for(int i=0;i<signPOList.size();i++){
                Sign sign = new Sign();
                BeanUtils.copyProperties(signPOList.get(i),sign);
                signList.add(sign);
            }
            return signList;
        }else{
            return null;
        }
    }

    @Override
    public Sign addSign(Sign sign){
        SignPO signPO = new SignPO();
        BeanUtils.copyProperties(sign,signPO);
        signRepository.save(signPO);
        return sign;
    }
    @Override
    public void deleteSign(Integer id){
        signRepository.delete(id);
    }
}
