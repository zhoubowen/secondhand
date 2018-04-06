package com.ask.service;

import com.ask.dto.CommentDTO;
import com.ask.entity.Comment;
import com.ask.param.CommentQueryParam;
import com.ask.util.PageUtil;

import java.util.List;

/**
 */
public interface CommentService {

    int add(Comment comment);

    List<Comment> findForPage(CommentQueryParam commentQueryParam, PageUtil pageUtil);

    List<CommentDTO> findPageCommentByMemberId(Integer memberId, PageUtil pageUtil);

    List<CommentDTO> findPageCommentByAskId(Integer askId, PageUtil pageUtil);

}
