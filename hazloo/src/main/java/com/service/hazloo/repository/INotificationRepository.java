package com.service.hazloo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.service.hazloo.domain.Notification;

public interface INotificationRepository extends JpaRepository<Notification, Long>{
    
    @Query(value = "SELECT * FROM tbl_notificaciones WHERE id = :id",nativeQuery = true)
	Notification getNotificationById(@Param("id") Long id); 

    @Query(value = "SELECT * FROM tbl_notificaciones WHERE user_id = :user AND status = :status",nativeQuery = true)
	List<Notification> getNotificationByUserAndStatus(@Param("user") Long user,@Param("status") Integer status); 

}
