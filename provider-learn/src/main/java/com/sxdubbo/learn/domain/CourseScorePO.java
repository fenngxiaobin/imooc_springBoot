package com.sxdubbo.learn.domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "CourseScore")
public class CourseScorePO implements Serializable{
    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "uid")
    private UserPO userPO;
    @OneToOne
    @JoinColumn(name = "cid")
    private CoursePO coursePO;
    private double score;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UserPO getUserPO() {
        return userPO;
    }

    public void setUserPO(UserPO userPO) {
        this.userPO = userPO;
    }

    public CoursePO getCoursePO() {
        return coursePO;
    }

    public void setCoursePO(CoursePO coursePO) {
        this.coursePO = coursePO;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
