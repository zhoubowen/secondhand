package com.student.report.entity;

import org.apache.ibatis.type.Alias;

import javax.persistence.*;
import java.util.Date;

/**
 * 会员信息
 */
@Entity
@Table(name = "t_member")
public class Member {
    @Id
    private Integer id;
    private String account;
    private String password;
    private String email;
    private String name;
    private String company;
    private Integer status;
    private Integer roleType;
    private Long phone;
    @Column(name="join_schedue")
    private Integer joinSchedue;
    private Integer major;
    @Transient
    private Dictionary majorDic;
    private Integer clazz;
    @Transient
    private Dictionary clazzDic;
    private Integer dormitory;
    @Transient
    private Dictionary dormitoryDic;
    private String schoolNo;
    private Integer tuition;
    @Column(name = "create_time")
    private Date createTime;
    @Column(name = "update_time")
    private Date updateTime;

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public Integer getJoinSchedue() {
        return joinSchedue;
    }

    public void setJoinSchedue(Integer joinSchedue) {
        this.joinSchedue = joinSchedue;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    public Integer getMajor() {
        return major;
    }

    public void setMajor(Integer major) {
        this.major = major;
    }

    public Dictionary getMajorDic() {
        return majorDic;
    }

    public void setMajorDic(Dictionary majorDic) {
        this.majorDic = majorDic;
    }

    public Integer getClazz() {
        return clazz;
    }

    public void setClazz(Integer clazz) {
        this.clazz = clazz;
    }

    public Dictionary getClazzDic() {
        return clazzDic;
    }

    public void setClazzDic(Dictionary clazzDic) {
        this.clazzDic = clazzDic;
    }

    public Integer getDormitory() {
        return dormitory;
    }

    public void setDormitory(Integer dormitory) {
        this.dormitory = dormitory;
    }

    public Dictionary getDormitoryDic() {
        return dormitoryDic;
    }

    public void setDormitoryDic(Dictionary dormitoryDic) {
        this.dormitoryDic = dormitoryDic;
    }

    public String getSchoolNo() {
        return schoolNo;
    }

    public void setSchoolNo(String schoolNo) {
        this.schoolNo = schoolNo;
    }

    public Integer getTuition() {
        return tuition;
    }

    public void setTuition(Integer tuition) {
        this.tuition = tuition;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", company='" + company + '\'' +
                ", status=" + status +
                ", phone=" + phone +
                ", joinSchedue=" + joinSchedue +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
