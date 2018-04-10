package com.secondhand.service;

import com.secondhand.entity.Ask;
import com.secondhand.param.AskQueryParam;
import com.secondhand.util.PageUtil;

import java.util.List;

/**
 */
public interface AskService {

    List<Ask> findForPage(AskQueryParam askQueryParam, PageUtil pageUtil);

    Ask findById(Integer id);

    int updateByPrimaryKeySelective(Ask ask);

    int add(Ask ask);
}
