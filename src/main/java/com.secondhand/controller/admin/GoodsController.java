package com.secondhand.controller.admin;

import com.secondhand.entity.Goods;
import com.secondhand.param.GoodsQueryParam;
import com.secondhand.service.GoodsService;
import com.secondhand.util.PageUtil;
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
