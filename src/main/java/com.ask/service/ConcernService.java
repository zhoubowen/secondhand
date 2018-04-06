package com.ask.service;

import com.ask.entity.Concern;
import org.springframework.stereotype.Service;

/**
 */
public interface ConcernService {

    int add(Concern concern);

    boolean isConcern(Integer askId, Integer memberId);

}
