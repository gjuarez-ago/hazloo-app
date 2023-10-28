package com.service.hazloo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.service.hazloo.domain.Notification;

public interface INotificationRepository extends JpaRepository<Notification, Long>{
    
}
