package com.service.hazloo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.service.hazloo.domain.Notification;

public interface ILogRepository extends JpaRepository<Notification, Long>{

    @Query(value = "SELECT * FROM tbl_notificaciones WHERE id = :id",nativeQuery = true)
	List<Notification> getNotificationById(@Param("id") Long plnId); 
    
}