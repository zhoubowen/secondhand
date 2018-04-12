package com.student.report.service;

import com.student.report.entity.Goods;
import com.student.report.param.AskQueryParam;
import com.student.report.param.GoodsQueryParam;
import com.student.report.util.PageUtil;

import java.util.List;

/**
 */
public interface GoodsService {

    List<Goods> findForPage(GoodsQueryParam goodsQueryParam, PageUtil pageUtil);

    Goods findById(Integer id);

    int updateByPrimaryKeySelective(Goods goods);
}
