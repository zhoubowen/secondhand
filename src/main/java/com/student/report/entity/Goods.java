package com.student.report.entity;

import sun.misc.Contended;

import javax.persistence.*;
import java.util.Date;

/**
 */
@Entity
@Table(name = "t_goods")
public class Goods {

    @Id
    private Integer id;
    private String title;
    private String description;
    @Column(name = "create_by")
    private Integer createBy;
    @Transient
    private Member member;
    private Integer price;
    private Integer phone;
    private Integer firstType;
    @Transient
    private Category firstCategory;
    private Integer views;
    private String pic;
    private Integer status;
    private Integer deleted;
    @Column(name = "create_time")
    private Date createTime;
    @Column(name = "update_time")
    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public Integer getFirstType() {
        return firstType;
    }

    public void setFirstType(Integer firstType) {
        this.firstType = firstType;
    }

    public Category getFirstCategory() {
        return firstCategory;
    }

    public void setFirstCategory(Category firstCategory) {
        this.firstCategory = firstCategory;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
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

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", createBy=" + createBy +
                ", member=" + member +
                ", price=" + price +
                ", phone=" + phone +
                ", firstType=" + firstType +
                ", firstCategory=" + firstCategory +
                ", views=" + views +
                ", pic='" + pic + '\'' +
                ", status=" + status +
                ", deleted=" + deleted +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
