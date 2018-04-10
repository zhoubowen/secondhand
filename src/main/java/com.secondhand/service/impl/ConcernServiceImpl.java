package com.secondhand.service.impl;

import com.secondhand.entity.Concern;
import com.secondhand.mapper.ConcernMapper;
import com.secondhand.service.ConcernService;
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
