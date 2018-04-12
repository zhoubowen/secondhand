package com.student.report.controller.admin;

import com.student.report.entity.Goods;
import com.student.report.param.GoodsQueryParam;
import com.student.report.service.GoodsService;
import com.student.report.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 */
@Controller
@RequestMapping("/admin/goods/")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping("index")
    public ModelAndView index(GoodsQueryParam goodsQueryParam, PageUtil pageUtil){
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> list = goodsService.findForPage(goodsQueryParam, pageUtil);
        modelAndView.setViewName("/admin/goods");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }
}
