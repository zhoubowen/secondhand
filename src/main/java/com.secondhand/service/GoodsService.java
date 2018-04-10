package com.secondhand.service;

import com.secondhand.entity.Goods;
import com.secondhand.param.AskQueryParam;
import com.secondhand.param.GoodsQueryParam;
import com.secondhand.util.PageUtil;

import java.util.List;

/**
 */
public interface GoodsService {

    List<Goods> findForPage(GoodsQueryParam goodsQueryParam, PageUtil pageUtil);

    Goods findById(Integer id);

    int updateByPrimaryKeySelective(Goods goods);
}
