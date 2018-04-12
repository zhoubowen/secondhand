package com.student.report.service;

import com.student.report.dto.CommentDTO;
import com.student.report.entity.Comment;
import com.student.report.param.CommentQueryParam;
import com.student.report.util.PageUtil;

import java.util.List;

/**
 */
public interface CommentService {

    int add(Comment comment);

    List<Comment> findForPage(CommentQueryParam commentQueryParam, PageUtil pageUtil);

    List<CommentDTO> findPageCommentByMemberId(Integer memberId, PageUtil pageUtil);

    List<CommentDTO> findPageCommentByAskId(Integer askId, PageUtil pageUtil);

}
