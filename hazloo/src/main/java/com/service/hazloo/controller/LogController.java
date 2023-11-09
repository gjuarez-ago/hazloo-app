package com.service.hazloo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.service.hazloo.domain.Log;
import com.service.hazloo.expcetion.GenericException;
import com.service.hazloo.service.ILogService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "Log Controller V1")
@RestController
@RequestMapping("/api/log")
public class LogController{

    @Autowired
    private ILogService service;

    @ApiOperation(value = "Endpoint for get log by user")
	@GetMapping("/log-by-user/{id}") 
    public ResponseEntity<List<Log>> getLogByUser(@PathVariable("id") Long userId) {
        List<Log> res = service.getLogByUser(userId);
		return new ResponseEntity<>(res, HttpStatus.OK);
    }

    @ApiOperation(value = "Endpoint for get log by ID")
	@GetMapping("/log-by-id/{id}") 
    public ResponseEntity<Log> getLogById(@PathVariable("id") Long id) throws GenericException {
        Log res = service.getLogById(id);
		return new ResponseEntity<>(res, HttpStatus.OK);
    }
    
}
