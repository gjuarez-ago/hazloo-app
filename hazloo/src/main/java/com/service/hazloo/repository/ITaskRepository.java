package com.service.hazloo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.service.hazloo.domain.Task;

public interface ITaskRepository extends JpaRepository<Task, Long>{
    
    @Query(value = "SELECT * FROM tbl_tareas WHERE user_id = :user ORDER BY reg_date_created DESC",nativeQuery = true)
	List<Task> getTaskByUser(@Param("user") Long userId);
    
    @Query(value = "SELECT * FROM tbl_tareas WHERE id = :id",nativeQuery = true)
	Task getTaskById(@Param("id") Long id);

    @Query(value = "SELECT * FROM tbl_tareas ORDER BY reg_date_created DESC",nativeQuery = true)
	List<Task> getTaskByParams(@Param("title") String title, @Param("category") Long category, @Param("user") Long user, @Param("status") boolean status);

    @Query(value = "SELECT * FROM tbl_tareas WHERE title = :title",nativeQuery = true)
	Task getTaskByTitle(@Param("title") String title); 
    
}
