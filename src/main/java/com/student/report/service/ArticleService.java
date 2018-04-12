package com.student.report.service;

import com.student.report.entity.Article;
import com.student.report.param.ArticleQueryParam;
import com.student.report.util.PageUtil;

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
