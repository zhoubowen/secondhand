package com.student.report.service.member;

import com.BaseTest;
import com.student.report.entity.Member;
import com.student.report.param.MemberQueryParam;
import com.student.report.service.MemberService;
import com.student.report.util.MD5Util;
import com.student.report.util.PageUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 */
public class MemberServiceTest extends BaseTest {

    @Autowired
    private MemberService memberService;

    @Test
    public void findAllTest(){
        List<Member> list = memberService.findAll();
        System.out.println(list);
    }

    @Test
    public void findForPageTest(){
        MemberQueryParam memberQueryParam = new MemberQueryParam();
        PageUtil pageUtil = new PageUtil();
        List<Member> list = memberService.findForPage(memberQueryParam, pageUtil);
        System.out.println(list);
    }

    @Test
    public void addTest(){
        Member member = new Member();
        member.setAccount("zhangshan");
        member.setName("张三");
        member.setCompany("格力集团股份有限公司");
        member.setEmail("zhangshan@gmail.com");
        member.setPassword(MD5Util.EncoderByMd5("123456"));
        int row = memberService.add(member);
        System.out.println(row);
    }

    @Test
    public void updateTest(){
        Member member = new Member();
        member.setId(2);
        member.setAccount("wangmazi");
        member.setName("王麻子");
        member.setCompany("盛大网络");
        member.setStatus(0);
        member.setEmail("zhangshan@gmail.com");
        member.setPassword(MD5Util.EncoderByMd5("123456"));
        int row = memberService.update(member);
        System.out.println(row);
    }
}
