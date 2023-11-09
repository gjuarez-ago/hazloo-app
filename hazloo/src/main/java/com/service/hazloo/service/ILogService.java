package com.service.hazloo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.service.hazloo.domain.Log;
import com.service.hazloo.expcetion.GenericException;

@Service
public interface ILogService {

    List<Log> getLogByUser(Long userId);

    Log getLogById(Long id) throws GenericException;

}
