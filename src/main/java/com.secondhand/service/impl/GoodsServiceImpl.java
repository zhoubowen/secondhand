package com.secondhand.service.impl;

import com.github.pagehelper.PageHelper;
import com.secondhand.constant.CommonConstant;
import com.secondhand.entity.Goods;
import com.secondhand.entity.Member;
import com.secondhand.mapper.GoodsMapper;
import com.secondhand.mapper.MemberMapper;
import com.secondhand.param.GoodsQueryParam;
import com.secondhand.service.GoodsService;
import com.secondhand.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 */
@Service
public class GoodsServiceImpl implements GoodsService{

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<Goods> findForPage(GoodsQueryParam goodsQueryParam, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Goods.class);
        example.setOrderByClause("update_time DESC");
        Example.Criteria criteria = example.createCriteria();
        criteria.andNotEqualTo("deleted", CommonConstant.VALID);
//        criteria.andEqualTo("status", goodsQueryParam.getStatus());
        if(null != goodsQueryParam.getMemberId()){
            criteria.andEqualTo("createBy", goodsQueryParam.getMemberId());
        }

        List<Goods> list = goodsMapper.selectByExample(example);
        if(!CollectionUtils.isEmpty(list)){
            for(Goods article : list){
                Member member = memberMapper.selectByPrimaryKey(article.getCreateBy());
                article.setMember(member);
            }
        }
        pageUtil.setRecordCount(goodsMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public Goods findById(Integer id) {
        return goodsMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Goods goods) {
        return goodsMapper.updateByPrimaryKeySelective(goods);
    }
}
