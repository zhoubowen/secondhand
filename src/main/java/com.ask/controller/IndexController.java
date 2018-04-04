package com.ask.controller;

import com.ask.entity.Article;
import com.ask.entity.Ask;
import com.ask.param.ArticleQueryParam;
import com.ask.param.AskQueryParam;
import com.ask.service.ArticleService;
import com.ask.service.AskService;
import com.ask.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 */
@Controller
public class IndexController {


    @Autowired
    private AskService askService;

    @RequestMapping("/")
    public ModelAndView index(AskQueryParam askQueryParam, PageUtil pageUtil){
        List<Ask> list = askService.findForPage(askQueryParam, pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

//    @RequestMapping("/detail")
//    public ModelAndView detail(Integer id, Integer type){
//        Article article = articleService.findById(id);
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("detail");
//        modelAndView.addObject("type", type);
//        modelAndView.addObject("article", article);
//        return modelAndView;
//    }

}
