package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.BulletScreenPO;
import com.sxdubbo.learn.domain.CommentPO;
import com.sxdubbo.learn.repository.BulletScreenRepository;
import com.sxdubboapi.learn.domain.BulletScreen;
import com.sxdubboapi.learn.service.BulletScreenService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * created by  luwei
 * 2018-01-22 19:59.
 **/
public class BulletScreenServiceImpl implements BulletScreenService {

    @Autowired
    public BulletScreenRepository bulletScreenRepository;

    @Override
    public List<BulletScreen> findByVideoId(Integer videoId) {
        List<BulletScreen> bulletScreenList= new ArrayList<>();
        List<BulletScreenPO> bulletScreenPOList= new ArrayList<>();
        bulletScreenPOList = bulletScreenRepository.findByVideoId(videoId);
        for(int i =0;i<bulletScreenPOList.size();i++){
            BulletScreen bulletScreen = new BulletScreen();
            BeanUtils.copyProperties(bulletScreenPOList.get(i),bulletScreen);
            bulletScreenList.add(bulletScreen);
        }
//        BeanUtils.copyProperties(bulletScreenPO, bulletScreen);
        return bulletScreenList;
    }

    @Override
    public BulletScreen addBulletScreen(BulletScreen bulletScreen){
        BulletScreenPO bulletScreenPO = new BulletScreenPO();
        BeanUtils.copyProperties(bulletScreen,bulletScreenPO);
        bulletScreenPO = bulletScreenRepository.save(bulletScreenPO);
        return bulletScreen;
    }
}
