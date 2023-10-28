package com.service.hazloo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.service.hazloo.domain.Task;

public interface ITaskRepository extends JpaRepository<Task, Long>{
    
}
