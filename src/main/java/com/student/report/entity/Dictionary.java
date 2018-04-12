package com.student.report.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 */
@Table(name = "t_dictionary")
@Entity
public class Dictionary {

    @Id
    private Integer id;
    private String dicName;
    private Integer dicKey;
    private String dicValue;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDicName() {
        return dicName;
    }

    public void setDicName(String dicName) {
        this.dicName = dicName;
    }

    public Integer getDicKey() {
        return dicKey;
    }

    public void setDicKey(Integer dicKey) {
        this.dicKey = dicKey;
    }

    public String getDicValue() {
        return dicValue;
    }

    public void setDicValue(String dicValue) {
        this.dicValue = dicValue;
    }

    public Dictionary() {
    }


    public Dictionary(String dicName) {
        this.dicName = dicName;
    }

    public Dictionary(Integer id, String dicName, Integer dicKey, String dicValue) {
        this.id = id;
        this.dicName = dicName;
        this.dicKey = dicKey;
        this.dicValue = dicValue;
    }

    @Override
    public String toString() {
        return "Dictionary{" +
                "id=" + id +
                ", dicName='" + dicName + '\'' +
                ", dicKey='" + dicKey + '\'' +
                ", dicValue='" + dicValue + '\'' +
                '}';
    }
}
