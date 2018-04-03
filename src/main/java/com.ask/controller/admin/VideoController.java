package com.ask.controller.admin;

import com.ask.entity.Video;
import com.ask.param.VideoQueryParam;
import com.ask.service.VideoService;
import com.ask.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 */
@Controller
@RequestMapping("/admin/video/")
public class VideoController {

    @Autowired
    private VideoService videoService;

    @RequestMapping("index")
    public ModelAndView index(VideoQueryParam videoQueryParam, PageUtil pageUtil){
        List<Video> list = videoService.findForPage(videoQueryParam , pageUtil);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/video");
        modelAndView.addObject("list", list);
        modelAndView.addObject("page", pageUtil);
        return modelAndView;
    }

    @RequestMapping("delete")
    public String delete(Integer id){
        videoService.deleteByPrimaryKey(id);
        return "redirect:/admin/video/index";
    }


    @RequestMapping("input")
    public ModelAndView input(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/videoInput");
        return modelAndView;
    }

    @RequestMapping("save")
    public String save(Video video){
        videoService.add(video);
        return "redirect:/admin/video/index";
    }
}
