package com.secondhand.mapper;

import com.secondhand.dto.CommentDTO;
import com.secondhand.entity.Comment;
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
