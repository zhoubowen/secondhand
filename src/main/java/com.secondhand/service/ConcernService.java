package com.secondhand.service;

import com.secondhand.entity.Concern;
import org.springframework.stereotype.Service;

/**
 */
public interface ConcernService {

    int add(Concern concern);

    boolean isConcern(Integer askId, Integer memberId);

}
