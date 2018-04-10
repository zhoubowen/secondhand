package com.secondhand.controller;

import com.secondhand.entity.Ask;
import com.secondhand.entity.Concern;
import com.secondhand.service.AskService;
import com.secondhand.service.ConcernService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 */
@Controller
@RequestMapping("/concern/")
public class ConcernController {

    @Autowired
    private ConcernService concernService;
    @Autowired
    private AskService askService;

    @RequestMapping("add")
    public String add(HttpServletRequest request, Concern concern){
        Integer id = (Integer) request.getSession().getAttribute("memberId");
        if(null == id){
            return "redirect:/member/loginInput";
        }
        concern.setMemberId(id);
        concernService.add(concern);

        Ask ask = askService.findById(concern.getAskId());
        ask.setConcerns(ask.getConcerns() + 1);
        askService.updateByPrimaryKeySelective(ask);
        return "redirect:/detail?id=" + concern.getAskId();
    }
}
