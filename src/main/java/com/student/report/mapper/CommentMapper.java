package com.student.report.mapper;

import com.student.report.dto.CommentDTO;
import com.student.report.entity.Comment;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 */
public interface CommentMapper extends Mapper<Comment> {

    List<CommentDTO> findPageCommentByMemberId(Integer memberId);

    Integer findCountCommentByMemberId(Integer memberId);

    List<CommentDTO> findPageCommentByAskId(Integer askId);

    Integer findCountCommentByAskId(Integer askId);
}
