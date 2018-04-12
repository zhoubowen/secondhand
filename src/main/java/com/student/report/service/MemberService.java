package com.student.report.service;

import com.student.report.entity.Member;
import com.student.report.exception.BusinessException;
import com.student.report.param.MemberQueryParam;
import com.student.report.util.PageUtil;

import java.util.List;
import java.util.Map;

/**
 */
public interface MemberService {

    List<Member> findAll();

    List<Member> findAllForValid();

    List<Member> findForPage(MemberQueryParam memberQueryParam, PageUtil pageUtil);

    int add(Member member);

    int update(Member member);

    Member login(Member member) throws BusinessException;

    Member findByMemberId(Integer memberId);
}
