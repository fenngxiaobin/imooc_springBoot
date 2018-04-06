package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.QaPO;
import com.sxdubbo.learn.domain.QaReplyPO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubbo.learn.repository.QaReplyRepository;
import com.sxdubbo.learn.utils.BeanTransferQa;
import com.sxdubboapi.learn.domain.Qa;
import com.sxdubboapi.learn.domain.QaReply;
import com.sxdubboapi.learn.domain.User;
import com.sxdubboapi.learn.service.QaReplyService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by fxb on 18-3-8.
 */
public class QaReplyServiceImp implements QaReplyService {
    @Autowired
    private QaReplyRepository qaReplyRepository;

    @Override
    public List<QaReply> findByQa(Qa qa){
        List<QaReply> qaReplyList=new ArrayList<>();
        QaPO qaPO=new QaPO();
        BeanTransferQa.transferToQaPO(qa,qaPO);
        System.out.println("QaReplyServiceImp:"+qaPO.getTitle());
        List<QaReplyPO> qaReplyPOList=qaReplyRepository.findByQaPO(qaPO);
        System.out.println("size:"+qaReplyPOList.size());
        BeanTransferQa.transferToQaReplyList(qaReplyPOList,qaReplyList);
        return qaReplyList;
    }


    @Override
    public List<QaReply> findByqaReplyToPOId(Integer id){
        List<QaReply> qaReplyList=new ArrayList<>();
        List<QaReplyPO> qaReplyPOList=qaReplyRepository.findByqaReplyToPOId(id);
        List<QaReply> qaReplyList1=BeanTransferQa.transferToQaReplyList(qaReplyPOList,qaReplyList);
        return qaReplyList1;
    }

    @Override
    public List<QaReply> findByUser(User user){
        UserPO userPO = new UserPO();
        BeanUtils.copyProperties(user,userPO);
        List<QaReplyPO> qaReplyPOList=qaReplyRepository.findByUserPO(userPO);
        List<QaReply> qaReplyList=new ArrayList<>();
        BeanTransferQa.transferToQaReplyList(qaReplyPOList,qaReplyList);
        return qaReplyList;
    }
    @Override
    public QaReply findById(Integer id){
        QaReply qaReply=new QaReply();
        QaReplyPO qaReplyPO=qaReplyRepository.findById(id);
        QaReply qaReply1=BeanTransferQa.transferToQaReply(qaReplyPO,qaReply);
        return qaReply1;
    }

    @Override
    public List<QaReply> findAll(){
        List<QaReplyPO> qaReplyPOList=qaReplyRepository.findAll();
        List<QaReply> qaReplyList=new LinkedList<>();
        List<QaReply> qaReplyList1=BeanTransferQa.transferToQaReplyList(qaReplyPOList,qaReplyList);
        return qaReplyList1;
    }

    @Override
    public List<QaReply> findByqaReplyId(Integer id){
        List<QaReplyPO> list=qaReplyRepository.findByqaReplyId(id);
        List<QaReply> list1=new ArrayList<>();
        List<QaReply> list2=BeanTransferQa.transferToQaReplyList(list,list1);
        return list2;
    }
//    @Override
//    public QaReply findByQaReplyId(Integer qaReplyId){
//        QaReply qaReply=new QaReply();
//        QaReplyPO qaReplyPO=qaReplyRepository.findByReply_id(qaReplyId);
//        BeanTransferQa.transferToQaReply(qaReplyPO,qaReply);
//        return qaReply;
//    }


    //    保存一个回复信息
    @Override
    public QaReply saveQaReply(QaReply qaReply){
        QaReplyPO qaReplyPO=new QaReplyPO();
        qaReplyPO=BeanTransferQa.transferToQaReplyPO(qaReply,qaReplyPO);
        QaReplyPO qaReplyPO1=qaReplyRepository.save(qaReplyPO);
        return qaReply;
    }

    @Override
    public void deleteQaReply(Integer qaReplyId){
        qaReplyRepository.delete(qaReplyId);
    }

}
