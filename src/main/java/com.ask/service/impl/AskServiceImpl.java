package com.ask.service.impl;

import com.ask.constant.CommonConstant;
import com.ask.entity.Ask;
import com.ask.entity.Member;
import com.ask.mapper.AskMapper;
import com.ask.mapper.MemberMapper;
import com.ask.param.AskQueryParam;
import com.ask.service.AskService;
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
public class AskServiceImpl implements AskService {

    @Autowired
    private AskMapper askMapper;
    @Autowired
    private MemberMapper memberMapper;


    @Override
    public List<Ask> findForPage(AskQueryParam askQueryParam, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Ask.class);
        example.setOrderByClause("id DESC");
        Example.Criteria criteria = example.createCriteria();
        criteria.andNotEqualTo("deleted", CommonConstant.VALID);
        criteria.andEqualTo("status", askQueryParam.getStatus());
        if(null != askQueryParam.getMemberId()){
            criteria.andNotEqualTo("createBy", askQueryParam.getMemberId());
        }
        List<Ask> list = askMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(list)){
            for(Ask article : list){
                Member member = memberMapper.selectByPrimaryKey(article.getCreateBy());
                article.setMember(member);
            }
        }
        pageUtil.setRecordCount(askMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public int updateByPrimaryKeySelective(Ask ask) {
        return askMapper.updateByPrimaryKeySelective(ask);
    }
}
