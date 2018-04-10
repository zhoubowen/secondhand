package com.secondhand.service;

import com.secondhand.entity.Ask;
import com.secondhand.entity.Video;
import com.secondhand.param.VideoQueryParam;
import com.secondhand.util.PageUtil;

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
