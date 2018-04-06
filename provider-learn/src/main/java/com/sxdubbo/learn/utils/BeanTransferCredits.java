package com.sxdubbo.learn.utils;


import com.sxdubbo.learn.domain.CreditsPO;
import com.sxdubbo.learn.domain.UserPO;
import com.sxdubboapi.learn.domain.Credits;
import com.sxdubboapi.learn.domain.User;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * created by  luwei
 * 2018-03-06 11:15.
 **/
public class BeanTransferCredits {

    public static List<Credits> transferCreditsList(List<CreditsPO> creditsPOList,List<Credits> creditsList){
        for(int i = 0 ; i < creditsPOList.size() ; i++) {
            Credits credits = new Credits();
            User user = new User();
            BeanUtils.copyProperties(creditsPOList.get(i).getUserPO(),user);
            System.out.println("credits");
            BeanUtils.copyProperties(creditsPOList.get(i), credits);
            credits.setUser(user);
            creditsList.add(credits);
        }
        return creditsList;
    }

    public static CreditsPO transferCredits(Credits credits,CreditsPO creditsPO){
        UserPO userPO = new UserPO();
        BeanUtils.copyProperties(credits.getUser(),userPO);
        BeanUtils.copyProperties(credits, creditsPO);
        creditsPO.setUserPO(userPO);;
        return creditsPO;
    }
    public static Credits transferCredits(CreditsPO creditsPO,Credits credits){
        User user = new User();
        BeanUtils.copyProperties(creditsPO.getUserPO(),user);
        BeanUtils.copyProperties(creditsPO, credits);
        credits.setUser(user);
        return credits;
    }
}
