package com.service.hazloo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.service.hazloo.domain.Log;
import com.service.hazloo.domain.Task;

public interface ITaskRepository extends JpaRepository<Task, Long>{
    
    @Query(value = "SELECT * FROM tbl_tareas WHERE user_id = :user",nativeQuery = true)
	List<Log> getTaskByUser(@Param("user") Long userId); 

}
