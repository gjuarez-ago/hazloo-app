package com.service.hazloo.service;

import java.util.List;

import com.service.hazloo.domain.Task;
import com.service.hazloo.dto.TaskDTO;
import com.service.hazloo.dto.TaskFilterDTO;

public interface ITaskService {
   
    List<Task> getTasksByProjectAndUser(Long projectId, Long userId);

    Task getTaskById(Long id);
    
    Task createTask(TaskDTO request);

    Task updateTask(Long id, TaskDTO request);

    Task deleteTask(Long id);

    List<Task> filterTasksByParams(TaskFilterDTO params);

    Task solvedTask(boolean status, Long taskId);
    
}
