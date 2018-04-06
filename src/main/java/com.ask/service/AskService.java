package com.ask.service;

import com.ask.entity.Ask;
import com.ask.param.AskQueryParam;
import com.ask.util.PageUtil;

import java.util.List;

/**
 */
public interface AskService {

    List<Ask> findForPage(AskQueryParam askQueryParam, PageUtil pageUtil);

    Ask findById(Integer id);

    int updateByPrimaryKeySelective(Ask ask);

    int add(Ask ask);
}
