package com.student.report.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 */
@Table(name = "t_setting")
@Entity
public class Setting {

    @Id
    private Integer id;
    private String sKey;
    private String sValue;

    public Setting(String sKey) {
        this.sKey = sKey;
    }

    public Setting() {
    }

    public Setting(Integer id, String sKey, String sValue) {
        this.id = id;
        this.sKey = sKey;
        this.sValue = sValue;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getsKey() {
        return sKey;
    }

    public void setsKey(String sKey) {
        this.sKey = sKey;
    }

    public String getsValue() {
        return sValue;
    }

    public void setsValue(String sValue) {
        this.sValue = sValue;
    }
}
