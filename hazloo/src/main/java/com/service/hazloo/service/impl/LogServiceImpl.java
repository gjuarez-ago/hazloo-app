package com.service.hazloo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.hazloo.domain.Log;
import com.service.hazloo.repository.ILogRepository;
import com.service.hazloo.service.ILogService;

@Service
@Transactional
public class LogServiceImpl implements ILogService{

    @Autowired
    ILogRepository logRepository;

    @Override
    public List<Log> getLogByUser(Long userId) {
        
        return null;
    }

    @Override
    public Log getLogById() {
        throw new UnsupportedOperationException("Unimplemented method 'getLogById'");
    }
    



}
