package com.student.report.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 */
@Table(name = "t_concerns")
@Entity
public class Concern {

    @Id
    private Integer id;
    private Integer askId;
    private Integer memberId;

    public Concern() {
    }

    public Concern(Integer askId, Integer memberId) {
        this.askId = askId;
        this.memberId = memberId;
    }

    public Concern(Integer id, Integer askId, Integer memberId) {
        this.id = id;
        this.askId = askId;
        this.memberId = memberId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAskId() {
        return askId;
    }

    public void setAskId(Integer askId) {
        this.askId = askId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    @Override
    public String toString() {
        return "Concern{" +
                "id=" + id +
                ", askId=" + askId +
                ", memberId=" + memberId +
                '}';
    }
}
