package com.service.hazloo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.service.hazloo.domain.Notification;

@Service
public interface INotificationService {
 
    List<Notification> getNotificationsByUserRead(Long userId);

    List<Notification> getNotificationsByUserNotRead(Long userId);

    Notification geNotificationById(Long id);
    
}
