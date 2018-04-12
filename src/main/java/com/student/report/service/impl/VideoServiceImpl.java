package com.student.report.service.impl;

import com.student.report.constant.CommonConstant;
import com.student.report.entity.Member;
import com.student.report.entity.Video;
import com.student.report.mapper.MemberMapper;
import com.student.report.mapper.VideoMapper;
import com.student.report.param.VideoQueryParam;
import com.student.report.service.VideoService;
import com.student.report.util.PageUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 */
@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<Video> findForPage(VideoQueryParam videoQueryParam, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Video.class);
        example.setOrderByClause("id DESC");
        Example.Criteria criteria = example.createCriteria();
        if(null != videoQueryParam.getMemberId()){
            criteria.andNotEqualTo("createBy", videoQueryParam.getMemberId());
        }
        List<Video> list = videoMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(list)){
            for(Video video : list){
                Member member = memberMapper.selectByPrimaryKey(video.getCreateBy());
                video.setMember(member);
            }
        }
        pageUtil.setRecordCount(videoMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public int updateByPrimaryKeySelective(Video video) {
        return videoMapper.updateByPrimaryKeySelective(video);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return videoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(Video video) {
        return videoMapper.insert(video);
    }

    @Override
    public Video findById(Integer id) {
        return videoMapper.selectByPrimaryKey(id);
    }
}
