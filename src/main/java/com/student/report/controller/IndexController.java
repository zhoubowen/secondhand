package com.student.report.controller;

import com.student.report.constant.CommonConstant;
import com.student.report.dto.CommentDTO;
import com.student.report.entity.Article;
import com.student.report.entity.Ask;
import com.student.report.entity.Video;
import com.student.report.param.ArticleQueryParam;
import com.student.report.param.AskQueryParam;
import com.student.report.param.VideoQueryParam;
import com.student.report.service.*;
import com.student.report.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

/**
 */
@Controller
public class IndexController {


    @Autowired
    private AskService askService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ConcernService concernService;
    @Autowired
    private VideoService videoService;

    @RequestMapping("/")
    public ModelAndView index(AskQueryParam askQueryParam, PageUtil pageUtil){
        askQueryParam.setStatus(CommonConstant.VALID);
        List<Ask> list = askService.findForPage(askQueryParam, pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("list")
    public ModelAndView list(AskQueryParam askQueryParam, PageUtil pageUtil){
        List<Ask> list = askService.findForPage(askQueryParam, pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("askList");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("/detail")
    public ModelAndView detail(Integer id, HttpServletRequest request){
        Ask ask = askService.findById(id);
        List<CommentDTO> commentList = commentService.findPageCommentByAskId(id, new PageUtil());
        Integer memberId = (Integer) request.getSession().getAttribute("memberId");
        ModelAndView modelAndView = new ModelAndView();
        if(Objects.nonNull(memberId)){
            boolean concern = concernService.isConcern(id, memberId);
            modelAndView.addObject("concern", concern);
        }
        modelAndView.setViewName("detail");
        modelAndView.addObject("ask", ask);
        modelAndView.addObject("comment", CollectionUtils.isEmpty(commentList) ? null : commentList.get(0));
        return modelAndView;
    }


    @RequestMapping("askResolve")
    public String askResolve(Ask ask){
        askService.updateByPrimaryKeySelective(ask);
        return "redirect:/?status=1";
    }

    @RequestMapping("video/list")
    public ModelAndView videoList(VideoQueryParam videoQueryParam, PageUtil pageUtil){
        List<Video> list = videoService.findForPage(videoQueryParam , pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/template/hwmax/videoList");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("video/detail")
    public ModelAndView videoDetail(Integer id){
        Video video = videoService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/template/hwmax/videoDetail");
        modelAndView.addObject("video", video);
        return modelAndView;
    }
}
