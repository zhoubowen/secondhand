package com.secondhand.service;

import com.secondhand.entity.Member;
import com.secondhand.exception.BusinessException;
import com.secondhand.param.MemberQueryParam;
import com.secondhand.util.PageUtil;

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
