package com.student.report.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by bowen on 2018-04-01 09:26
 */
@Table(name = "t_ask")
@Entity
public class Ask {

    @Id
    private Integer id;
    private String title;
    private String descript;
    private Integer status;
    private Integer deleted;
    /**
     * memberId, 创建人
     */
    @Transient
    private Member member;

    @Column(name = "create_by")
    private Integer createBy;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private Integer concerns;

    public Integer getConcerns() {
        return concerns;
    }

    public void setConcerns(Integer concerns) {
        this.concerns = concerns;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    @Override
    public String toString() {
        return "Ask{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", descript='" + descript + '\'' +
                ", status=" + status +
                ", deleted=" + deleted +
                ", member=" + member +
                ", createBy=" + createBy +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
