package com.student.report.controller;

import com.student.report.entity.Ask;
import com.student.report.entity.Concern;
import com.student.report.service.AskService;
import com.student.report.service.ConcernService;
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
