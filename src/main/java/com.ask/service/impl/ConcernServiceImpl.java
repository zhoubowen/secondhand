package com.ask.service.impl;

import com.ask.entity.Concern;
import com.ask.mapper.ConcernMapper;
import com.ask.service.ConcernService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * Created by bowen on 2018-04-04 21:50
 */
@Service
public class ConcernServiceImpl implements ConcernService{

    @Autowired
    private ConcernMapper concernMapper;

    @Override
    public int add(Concern concern) {
        return concernMapper.insert(concern);
    }

    @Override
    public boolean isConcern(Integer askId, Integer memberId) {
        List<Concern> list = concernMapper.select(new Concern(askId, memberId));
        return CollectionUtils.isEmpty(list) ? false : true;
    }
}
