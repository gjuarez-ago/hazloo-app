package com.service.hazloo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.hazloo.domain.Log;
import com.service.hazloo.expcetion.GenericException;
import com.service.hazloo.repository.ILogRepository;
import com.service.hazloo.service.ILogService;

@Service
@Transactional
public class LogServiceImpl implements ILogService{

    @Autowired
    ILogRepository logRepository;

    @Override
    public List<Log> getLogByUser(Long userId) {
        return logRepository.getLogByUser(userId);
    }

    @Override
    public Log getLogById(Long id) throws GenericException {
        return existLog(id);
    }


    private Log existLog(Long id) throws GenericException {
       Log e = logRepository.getLogById(id);

        if(e == null) {
          throw new GenericException("No se encontro el recurso");
        }

        return e;
    }
    



}
