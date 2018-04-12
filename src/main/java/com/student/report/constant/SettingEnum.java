package com.student.report.constant;

/**
 */
public enum SettingEnum {
    ASK_THRESHOLD("ASK_THRESHOLD");

    SettingEnum(String key) {
        this.key = key;
    }

    private String key;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
