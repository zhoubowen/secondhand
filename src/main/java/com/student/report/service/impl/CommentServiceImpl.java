package com.student.report.service.impl;

import com.github.pagehelper.PageHelper;
import com.student.report.dto.CommentDTO;
import com.student.report.entity.Article;
import com.student.report.entity.Comment;
import com.student.report.mapper.CommentMapper;
import com.student.report.param.CommentQueryParam;
import com.student.report.service.CommentService;
import com.student.report.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

/**
 */
@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int add(Comment comment) {
        Date now = new Date();
        comment.setCreateTime(now);
        comment.setUpdateTime(now);
        return commentMapper.insert(comment);
    }

    @Override
    public List<Comment> findForPage(CommentQueryParam commentQueryParam, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        Example example = new Example(Article.class);
        example.setOrderByClause("id DESC");
        List<Comment> list = commentMapper.selectByExample(example);
        pageUtil.setRecordCount(commentMapper.selectCountByExample(example));
        return list;
    }

    @Override
    public List<CommentDTO> findPageCommentByMemberId(Integer memberId, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        List<CommentDTO> list = commentMapper.findPageCommentByMemberId(memberId);
        pageUtil.setRecordCount(commentMapper.findCountCommentByMemberId(memberId));
        return list;
    }

    @Override
    public List<CommentDTO> findPageCommentByAskId(Integer askId, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPage(), pageUtil.getSize());
        List<CommentDTO> list = commentMapper.findPageCommentByAskId(askId);
        pageUtil.setRecordCount(commentMapper.findCountCommentByAskId(askId));
        return list;
    }


}
