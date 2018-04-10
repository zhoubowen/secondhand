package com.secondhand.service;

import com.secondhand.entity.Setting;

/**
 */
public interface SettingService {

    Setting findByKey(String key);
    int updateByPrimaryKeySelective(Setting setting);
}
