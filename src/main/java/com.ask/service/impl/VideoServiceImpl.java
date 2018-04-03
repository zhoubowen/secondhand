package com.ask.service.impl;

import com.ask.constant.CommonConstant;
import com.ask.entity.Member;
import com.ask.entity.Video;
import com.ask.mapper.MemberMapper;
import com.ask.mapper.VideoMapper;
import com.ask.param.VideoQueryParam;
import com.ask.service.VideoService;
import com.ask.util.PageUtil;
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
}
