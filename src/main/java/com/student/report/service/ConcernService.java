package com.student.report.service;

import com.student.report.entity.Concern;
import org.springframework.stereotype.Service;

/**
 */
public interface ConcernService {

    int add(Concern concern);

    boolean isConcern(Integer askId, Integer memberId);

}
