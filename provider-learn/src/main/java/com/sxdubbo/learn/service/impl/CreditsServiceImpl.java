package com.sxdubbo.learn.service.impl;

import com.sxdubbo.learn.domain.CreditsPO;
import com.sxdubbo.learn.repository.CreditsRepository;
import com.sxdubbo.learn.utils.BeanTransferCredits;
import com.sxdubboapi.learn.domain.Credits;
import com.sxdubboapi.learn.service.CreditsService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.criteria.CriteriaBuilder;

/**
 * created by  luwei
 * 2018-03-18 19:14.
 **/
public class CreditsServiceImpl implements CreditsService{
    @Autowired
    public CreditsRepository creditsRepository;

    @Override
    public Credits addCredits(Credits credits){
        CreditsPO creditsPO = new CreditsPO();
        BeanTransferCredits.transferCredits(credits,creditsPO);
        creditsRepository.save(creditsPO);
        return credits;
    }

    @Override
    public Credits updateCredits(Credits credits){
        CreditsPO creditsPO = new CreditsPO();
        BeanTransferCredits.transferCredits(credits,creditsPO);
        creditsRepository.save(creditsPO);
        return credits;
    }
    @Override
    public Credits findByUserId(Integer userId){
        Credits credits = new Credits();
        CreditsPO creditsPO = creditsRepository.findByUserPO_Id(userId);
        if(creditsPO != null){
            BeanTransferCredits.transferCredits(creditsPO,credits);
            return credits;
        }else{
            return null;
        }
    }

    @Override
    public Credits findById(Integer id){
        Credits credits = new Credits();
        CreditsPO creditsPO = creditsRepository.findOne(id);
        if(creditsPO != null){
            BeanTransferCredits.transferCredits(creditsPO,credits);
            return credits;
        }else{
            return null;
        }
    }
}
