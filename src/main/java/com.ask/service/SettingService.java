package com.ask.service;

import com.ask.entity.Setting;

/**
 */
public interface SettingService {

    Setting findByKey(String key);
    int updateByPrimaryKeySelective(Setting setting);
}
