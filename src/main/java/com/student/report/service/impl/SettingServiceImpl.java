package com.student.report.service.impl;

import com.student.report.constant.SettingEnum;
import com.student.report.entity.Setting;
import com.student.report.mapper.SettingMapper;
import com.student.report.service.SettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.annotation.ColumnType;
import tk.mybatis.mapper.entity.Example;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

/**
 */
@Service
public class SettingServiceImpl implements SettingService{

    @Autowired
    private SettingMapper settingMapper;

    @Override
    public Setting findByKey(String key) {
        return settingMapper.selectOne(new Setting(key));
    }

    @Override
    public int updateByPrimaryKeySelective(Setting setting) {
        return settingMapper.updateByPrimaryKeySelective(setting);
    }
}
