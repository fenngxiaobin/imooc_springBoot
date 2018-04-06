package com.sxdubboapi.learn.domain;

import java.io.Serializable;
import java.util.HashMap;

public class CourseUser implements Serializable{
    private int uid;
    private HashMap<Integer,Double> courseScore;

    public CourseUser(int uid,HashMap<Integer,Double> courseScore){
        this.uid=uid;
        this.courseScore=courseScore;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public HashMap<Integer, Double> getCourseScore() {
        return courseScore;
    }

    public void setCourseScore(HashMap<Integer, Double> courseScore) {
        this.courseScore = courseScore;
    }
}
