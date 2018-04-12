package com.student.report.service;

import com.student.report.entity.Ask;
import com.student.report.entity.Video;
import com.student.report.param.VideoQueryParam;
import com.student.report.util.PageUtil;

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
