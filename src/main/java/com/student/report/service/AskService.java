package com.student.report.service;

import com.student.report.entity.Ask;
import com.student.report.param.AskQueryParam;
import com.student.report.util.PageUtil;

import java.util.List;

/**
 */
public interface AskService {

    List<Ask> findForPage(AskQueryParam askQueryParam, PageUtil pageUtil);

    Ask findById(Integer id);

    int updateByPrimaryKeySelective(Ask ask);

    int add(Ask ask);
}
