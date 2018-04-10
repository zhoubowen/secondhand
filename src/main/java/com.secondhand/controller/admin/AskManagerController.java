package com.secondhand.controller.admin;

import com.secondhand.constant.CommonConstant;
import com.secondhand.controller.CommentController;
import com.secondhand.entity.Ask;
import com.secondhand.param.AskQueryParam;
import com.secondhand.service.AskService;
import com.secondhand.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 */
@Controller
@RequestMapping("/admin/ask/")
public class AskManagerController {

    @Autowired
    private AskService askService;

    @RequestMapping("index")
    public ModelAndView index(AskQueryParam askQueryParam, PageUtil pageUtil){
        ModelAndView modelAndView = new ModelAndView();
        List<Ask> list = askService.findForPage(askQueryParam, pageUtil);
        modelAndView.setViewName("/admin/ask");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("update")
    public String update(Ask ask){
        askService.updateByPrimaryKeySelective(ask);
        return "redirect:/admin/ask/index";
    }
}
