package com.service.hazloo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;


import com.service.hazloo.domain.Task;
import com.service.hazloo.dto.SolvedTaskDTO;
import com.service.hazloo.dto.TaskDTO;
import com.service.hazloo.dto.TaskFilterDTO;
import com.service.hazloo.expcetion.GenericException;
import com.service.hazloo.service.ITaskService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "Task Controller V1")
@RestController
@RequestMapping("/api/task")
public class TaskController {

    @Autowired
    private ITaskService service;

    @ApiOperation(value = "Endpoint for get log by user and project")
	@GetMapping("/get-task-by-user/{project}/{user}") 
    public ResponseEntity<List<Task>> getTasksByProjectAndUser(@PathVariable("project") Long projectId, @PathVariable("user") Long userId) {
       List<Task> res = service.getTasksByProjectAndUser(projectId, userId);
		return new ResponseEntity<>(res, HttpStatus.OK);
    }

    @ApiOperation(value = "Endpoint for get log by user and project")
	@GetMapping("/get-task-by-id/{id}") 
    public ResponseEntity<Task> getTaskById(@PathVariable("id") Long id) throws GenericException {
        Task res = service.getTaskById(id);
		return new ResponseEntity<>(res, HttpStatus.OK);
    }

    @ApiOperation(value = "Endpoint for create task")
	@PostMapping("/create-task") 
    public ResponseEntity<Task> createTask(@RequestBody TaskDTO request) throws GenericException {
        Task res = service.createTask(request);
		return new ResponseEntity<>(res, HttpStatus.OK);
    }

    @ApiOperation(value = "Endpoint for update task")
	@PostMapping("/update-task/{id}") 
    public ResponseEntity<Task> updateTask(@PathVariable("id") Long id,@RequestBody TaskDTO request) throws GenericException {
        Task res = service.updateTask(id, request);
		return new ResponseEntity<>(res, HttpStatus.OK);
    }
    
    @ApiOperation(value = "Endpoint for delete task")
	@DeleteMapping("/delete-task/{id}") 
    public ResponseEntity<Task> deleteTask(@PathVariable("id") Long id) throws GenericException {
        Task res = service.deleteTask(id);
		return new ResponseEntity<>(res, HttpStatus.OK);
    }

    
    @ApiOperation(value = "Endpoint for get log by user and project")
	@GetMapping("/filters-task-by-user") 
    public ResponseEntity<List<Task>> filterTasksByParams(@RequestParam(value = "title", required =  false) String title,@RequestParam(value = "status", required =  false) boolean status,@RequestParam(value = "project", required =  false) Long project,@RequestParam(value = "user", required =  true) Long user) {
        List<Task> res = service.filterTasksByParams(new TaskFilterDTO(title, status, project, user));
		return new ResponseEntity<>(res, HttpStatus.OK);
    }

    @ApiOperation(value = "Endpoint for change status")
	@PostMapping("/solved-status") 
    public ResponseEntity<Task> solvedTask(@RequestBody SolvedTaskDTO request) throws GenericException {
        Task res = service.solvedTask(request.isStatus(), request.getTaskId());
		return new ResponseEntity<>(res, HttpStatus.OK);
    }

}
