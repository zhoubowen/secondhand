package com.secondhand.controller;

import com.alibaba.fastjson.JSON;
import com.secondhand.constant.CommonConstant;
import com.secondhand.dto.CommentDTO;
import com.secondhand.entity.Ask;
import com.secondhand.entity.Comment;
import com.secondhand.param.CommentQueryParam;
import com.secondhand.response.BaseResponse;
import com.secondhand.response.ErrorResponse;
import com.secondhand.response.SuccessResponse;
import com.secondhand.service.AskService;
import com.secondhand.service.CommentService;
import com.secondhand.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 */
@Controller
@RequestMapping("/comment/")
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private AskService askService;

    @RequestMapping("add")
    @ResponseBody
    public Object addComment(Comment comment, HttpServletRequest request){
        try {
            Integer memberId = (Integer) request.getSession().getAttribute("memberId");
//            if(null == memberId){
//                return "redirect:/member/loginInput";
//            }
            comment.setMemberId(memberId);
            int row = commentService.add(comment);
            if(row > 0){
                Ask ask = new Ask();
                ask.setId(comment.getArticleId());
                ask.setStatus(CommonConstant.VALID);
                askService.updateByPrimaryKeySelective(ask);
                return SuccessResponse.newInstance();
            }else{
                return ErrorResponse.newInstance();
            }
        } catch (Exception e) {
            return ErrorResponse.newInstance();
        }
    }

    @RequestMapping("list")
    public ModelAndView list(HttpServletRequest request, PageUtil pageUtil){
        Integer memberId = (Integer) request.getSession().getAttribute("memberId");
        List<CommentDTO> list = commentService.findPageCommentByMemberId(memberId, pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("comment");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("askCommentList")
    public Object list(Integer askId, PageUtil pageUtil){
        List<CommentDTO> list = commentService.findPageCommentByAskId(askId, pageUtil);
        return SuccessResponse.newInstance(JSON.toJSONString(list));
    }

}
