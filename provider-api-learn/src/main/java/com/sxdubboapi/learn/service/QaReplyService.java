package com.sxdubboapi.learn.service;

import com.sxdubboapi.learn.domain.Qa;
import com.sxdubboapi.learn.domain.QaReply;
import com.sxdubboapi.learn.domain.User;

import java.util.List;

/**
 * Created by fxb on 18-3-8.
 */
public interface QaReplyService {
    public List<QaReply> findByQa(Qa qa);
    public List<QaReply> findByqaReplyToPOId(Integer id);
    public QaReply findById(Integer id);
    public List<QaReply> findAll();
    public List<QaReply> findByUser(User user);
    public List<QaReply> findByqaReplyId(Integer id);
    //    public QaReply findByQaReplyId(Integer qaReplyId);
//    提供保存QaReply的服务
    public QaReply saveQaReply(QaReply qaReply);

    public void deleteQaReply(Integer qaReplyId);
}
