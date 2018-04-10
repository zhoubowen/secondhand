package com.secondhand.service.comment;

import com.BaseTest;
import com.secondhand.dto.CommentDTO;
import com.secondhand.entity.Comment;
import com.secondhand.service.CommentService;
import com.secondhand.util.PageUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by bowen on 2018-03-06 22:53
 */
public class CommentServiceTest extends BaseTest {

    @Autowired
    private CommentService commentService;

    @Test
    public void addTest(){
        Comment comment = new Comment();
        comment.setMemberId(21);
        comment.setArticleId(3);
        comment.setContent("我很感兴趣, 我的电话是....");
        commentService.add(comment);
        System.out.println("ok");
    }

    @Test
    public void listTest(){
        List<CommentDTO> list = commentService.findPageCommentByMemberId(21, new PageUtil());
        System.out.println("ok");
    }
}
