package com.student.report.service.article;

import com.BaseTest;
import com.student.report.entity.Article;
import com.student.report.service.ArticleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 */
public class ArticleServiceTest extends BaseTest {

    @Autowired
    private ArticleService articleService;

    @Test
    public void findByIdTest(){
        Article a = articleService.findById(1);
        System.out.println(a);
    }
}
