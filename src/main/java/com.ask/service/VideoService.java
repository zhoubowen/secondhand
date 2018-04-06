package com.ask.service;

import com.ask.entity.Ask;
import com.ask.entity.Video;
import com.ask.param.VideoQueryParam;
import com.ask.util.PageUtil;

import java.util.List;

/**
 */
public interface VideoService {

    List<Video> findForPage(VideoQueryParam videoQueryParam, PageUtil pageUtil);

    int updateByPrimaryKeySelective(Video video);

    int deleteByPrimaryKey(Integer id);

    int add(Video video);

    Video findById(Integer id);

}
