package com.ask.service;

import com.ask.entity.Member;
import com.ask.exception.BusinessException;
import com.ask.param.MemberQueryParam;
import com.ask.util.PageUtil;

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
