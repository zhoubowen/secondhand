package com.secondhand.service;

import com.secondhand.entity.Article;
import com.secondhand.param.ArticleQueryParam;
import com.secondhand.util.PageUtil;

import java.util.List;

/**
 */
public interface ArticleService {

    List<Article> findAllByExample(Integer type, Integer status);

    List<Article> findForPage(ArticleQueryParam articleQueryParam, PageUtil pageUtil);

    int add(Article article);

    int update(Article article);

    Article findById(Integer id);
}
