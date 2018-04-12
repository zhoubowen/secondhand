package com.student.report.service;

import com.student.report.entity.Setting;

/**
 */
public interface SettingService {

    Setting findByKey(String key);
    int updateByPrimaryKeySelective(Setting setting);
}
