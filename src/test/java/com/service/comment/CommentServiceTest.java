package com.student.report.service.comment;

import com.BaseTest;
import com.student.report.dto.CommentDTO;
import com.student.report.entity.Comment;
import com.student.report.service.CommentService;
import com.student.report.util.PageUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
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
