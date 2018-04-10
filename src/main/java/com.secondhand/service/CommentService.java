package com.secondhand.service;

import com.secondhand.dto.CommentDTO;
import com.secondhand.entity.Comment;
import com.secondhand.param.CommentQueryParam;
import com.secondhand.util.PageUtil;

import java.util.List;

/**
 */
public interface CommentService {

    int add(Comment comment);

    List<Comment> findForPage(CommentQueryParam commentQueryParam, PageUtil pageUtil);

    List<CommentDTO> findPageCommentByMemberId(Integer memberId, PageUtil pageUtil);

    List<CommentDTO> findPageCommentByAskId(Integer askId, PageUtil pageUtil);

}
