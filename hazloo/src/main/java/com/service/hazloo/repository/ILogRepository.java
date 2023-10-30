package com.service.hazloo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.service.hazloo.domain.Log;

public interface ILogRepository extends JpaRepository<Log, Long> {
    
    @Query(value = "SELECT * FROM tbl_log WHERE user_id = :user",nativeQuery = true)
	List<Log> getLogByUser(@Param("user") Long userId); 
    
    @Query(value = "SELECT * FROM tbl_log WHERE id = :id",nativeQuery = true)
    Log getLogById(@Param("id") Long id);

}