package com.ask.mapper;

import com.ask.dto.CommentDTO;
import com.ask.entity.Comment;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 */
public interface CommentMapper extends Mapper<Comment> {

    List<CommentDTO> findPageCommentByMemberId(Integer memberId);

    Integer findCountCommentByMemberId(Integer memberId);
}
