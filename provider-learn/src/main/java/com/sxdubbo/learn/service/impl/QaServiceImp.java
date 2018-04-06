package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.QaPO;
import com.sxdubbo.learn.domain.QaReplyPO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubbo.learn.domain.VideoPO;
import com.sxdubbo.learn.repository.QaReplyRepository;
import com.sxdubbo.learn.repository.QaRepository;
import com.sxdubbo.learn.utils.BeanTransferQa;
import com.sxdubboapi.learn.domain.Qa;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.domain.Video;
import com.sxdubboapi.learn.service.QaService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by fxb on 18-3-8.
 */
public class QaServiceImp implements QaService {
    @Autowired
    public QaRepository qaRepository;
    @Autowired
    public QaReplyRepository qaReplyRepository;

    @Override
    public List<Qa> findByVideo(Video video){

        VideoPO videoPO= new VideoPO();
        BeanUtils.copyProperties(video,videoPO);
        List<QaPO> qaPOList=qaRepository.findByVideoPO(videoPO);
        List<Qa> qaList=new ArrayList<>();
        //        qaPOList----->qaList
        BeanTransferQa.transferToQaList(qaPOList,qaList);
        return qaList;
    }

    @Override
    public List<Qa> findByUser(User user){
        UserPO userPO = new UserPO();
        BeanUtils.copyProperties(user,userPO);
        List<QaPO> qaPOList=qaRepository.findByUserPO(userPO);
        List<Qa> qaList=new ArrayList<>();
        BeanTransferQa.transferToQaList(qaPOList,qaList);
        return qaList;
    }

    @Override
    public Qa findById(Integer id){
        QaPO qaPO=qaRepository.findById(id);
        Qa qa=new Qa();
        BeanTransferQa.transferToQa(qaPO,qa);
        return qa;
    }


    /**
     * 获取问题列表
     * @return
     */
    @Override
    public List<Qa> findAllQa(){
        List<Qa> qaList= new ArrayList<Qa>();
//        在前台排序
        List<QaPO> qaPOList= qaRepository.findAll();
        System.out.println("qaRepository.findAll().size():"+qaPOList.size());
        BeanTransferQa.transferToQaList(qaPOList,qaList);
        return qaList;
    }

    /**
     * 保存一个问题
     * @param qa
     * @return
     */
    @Override
    public Qa saveQa(Qa qa){
        QaPO qaPO=new QaPO();
        qaPO=BeanTransferQa.transferToQaPO(qa,qaPO);
        QaPO qaPO1=qaRepository.save(qaPO);
        return qa;
    }

    /**
     * 删除指定id的question和相关的问答
     * @param id
     */
    @Override
    public void deleteQa(Integer id){
        QaPO qaPO = qaRepository.findById(id);
        List<QaReplyPO> qaReplyPOList = qaReplyRepository.findByQaPO(qaPO);
//        删除回复
        if(qaReplyPOList!=null){
            for(QaReplyPO qaReplyPO:qaReplyPOList){
                qaReplyRepository.delete(qaReplyPO);
            }
        }

//        删除指定id的问答
        qaRepository.delete(id);

    }

    @Override
    public List<Qa> findByLabel(String label){
        List<QaPO> qaPOList=qaRepository.findByLabel(label);
        List<Qa> qaList=new LinkedList<>();
        BeanTransferQa.transferToQaList(qaPOList,qaList);
        return qaList;
    }
}
