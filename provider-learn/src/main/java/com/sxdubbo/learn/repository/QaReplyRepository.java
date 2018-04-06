package com.sxdubbo.learn.repository;

import com.sxdubbo.learn.domain.QaPO;
import com.sxdubbo.learn.domain.QaReplyPO;
import com.sxdubbo.learn.domain.UserPO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by fxb on 18-3-8.
 */
public interface QaReplyRepository extends JpaRepository<QaReplyPO,Integer> {
    public List<QaReplyPO> findByQaPO(QaPO qaPO);
    public List<QaReplyPO> findByqaReplyToPOId(Integer id);
    public List<QaReplyPO> findByUserPO(UserPO userPO);
    public QaReplyPO findById(Integer id);
    public List<QaReplyPO>  findByqaReplyId(Integer id);
    //    public QaReplyPO findByReply_id(Integer replyId);
    public List<QaReplyPO> findAll();

    public QaReplyPO save(QaReplyPO qaReplyPO);
}
