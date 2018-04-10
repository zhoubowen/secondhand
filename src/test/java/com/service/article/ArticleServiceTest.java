package com.secondhand.service.article;

import com.BaseTest;
import com.secondhand.entity.Article;
import com.secondhand.service.ArticleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by bowen on 2018-02-27 23:08
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
