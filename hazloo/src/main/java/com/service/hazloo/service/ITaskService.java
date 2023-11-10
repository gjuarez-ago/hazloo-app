package com.service.hazloo.service;

import java.util.List;

import com.service.hazloo.domain.Task;
import com.service.hazloo.dto.TaskDTO;
import com.service.hazloo.dto.TaskFilterDTO;
import com.service.hazloo.expcetion.GenericException;

public interface ITaskService {
   
    List<Task> getTasksByProjectAndUser(Long projectId, Long userId);

    Task getTaskById(Long id) throws GenericException;
    
    Task createTask(TaskDTO request) throws GenericException;

    Task updateTask(Long id, TaskDTO request) throws GenericException;

    Task deleteTask(Long id) throws GenericException;

    List<Task> filterTasksByParams(TaskFilterDTO params);

    Task solvedTask(boolean status, Long taskId) throws GenericException;
    
}
