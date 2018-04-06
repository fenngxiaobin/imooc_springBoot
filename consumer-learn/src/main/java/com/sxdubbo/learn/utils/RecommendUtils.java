package com.sxdubbo.learn.utils;

import com.sxdubboapi.learn.domain.Course;
import com.sxdubboapi.learn.domain.CourseScore;
import com.sxdubboapi.learn.domain.CourseUser;
import com.sxdubboapi.learn.domain.User;

import java.util.List;

public class RecommendUtils {

    /**
     *  判断用户相似度
     * @param courseUser1 用户1
     * @param courseUser2 用户2
     */
    public static double getSimilarity(CourseUser courseUser1,CourseUser courseUser2){
        double sim=0;
        int commonItems=0;
        for (int cid1:courseUser1.getCourseScore().keySet()){
            for (int cid2:courseUser2.getCourseScore().keySet()){
                if(cid1==cid2){
                    commonItems++;
                    System.out.println(commonItems);
                    sim+=Math.pow((courseUser1.getCourseScore().get(cid1)-courseUser2.getCourseScore().get(cid2)),2);
                }
            }
        }
//        含有相同课程
        if(commonItems>0){
            sim=Math.sqrt(sim/commonItems);
//            使相似度保持在0-1之间
            sim = 1.0d - Math.tanh(sim);
            int maxCommonItems=Math.min(courseUser1.getCourseScore().keySet().size(),courseUser2.getCourseScore().keySet().size());
            sim = sim * ((double)commonItems/(double)maxCommonItems);
//            System.out.println("maxCommonItems:"+maxCommonItems);
//            System.out.println("commonItems:"+commonItems);
        }
        System.out.print("\n"); //Just for pretty printing in the Shell
        System.out.print(" User Similarity between");
        System.out.print(" "+courseUser1.getUid());
        System.out.print(" and "+courseUser2.getUid());
        System.out.println(" is equal to "+sim);
        System.out.print("\n"); //Just for pretty printing in the Shell
        return sim;
    }



}
