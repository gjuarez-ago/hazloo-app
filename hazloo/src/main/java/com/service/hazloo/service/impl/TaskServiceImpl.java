package com.service.hazloo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.hazloo.domain.Task;
import com.service.hazloo.dto.TaskDTO;
import com.service.hazloo.dto.TaskFilterDTO;
import com.service.hazloo.repository.ITaskRepository;
import com.service.hazloo.service.ITaskService;

@Service
@Transactional
public class TaskServiceImpl implements ITaskService{

    @Autowired
    private ITaskRepository repository;
    
    @Override
    public List<Task> getTasksByProjectAndUser(Long projectId, Long userId) {
        throw new UnsupportedOperationException("Unimplemented method 'getTasksByProjectAndUser'");
    }

    @Override
    public Task getTaskById(Long id) {
        throw new UnsupportedOperationException("Unimplemented method 'getTaskById'");
    }

    @Override
    public Task createTask(TaskDTO request) {
        throw new UnsupportedOperationException("Unimplemented method 'createTask'");
    }

    @Override
    public Task updateTask(Long id, TaskDTO request) {
        throw new UnsupportedOperationException("Unimplemented method 'updateTask'");
    }

    @Override
    public Task deleteTask(Long id) {
        throw new UnsupportedOperationException("Unimplemented method 'deleteTask'");
    }

    @Override
    public List<Task> filterTasksByParams(TaskFilterDTO params) {
        throw new UnsupportedOperationException("Unimplemented method 'filterTasksByParams'");
    }

    @Override
    public Task solvedTask(boolean status, Long taskId) {
        throw new UnsupportedOperationException("Unimplemented method 'solvedTask'");
    }
    
}
