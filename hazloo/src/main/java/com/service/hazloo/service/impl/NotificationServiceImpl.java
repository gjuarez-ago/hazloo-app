package com.service.hazloo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.hazloo.domain.Notification;
import com.service.hazloo.repository.INotificationRepository;
import com.service.hazloo.service.INotificationService;

@Service
@Transactional
public class NotificationServiceImpl implements INotificationService{

    @Autowired
    INotificationRepository repository;
    
    @Override
    public List<Notification> getNotificationsByUserRead(Long userId) {
        throw new UnsupportedOperationException("Unimplemented method 'getNotificationsByUserRead'");
    }

    @Override
    public List<Notification> getNotificationsByUserNotRead(Long userId) {
        throw new UnsupportedOperationException("Unimplemented method 'getNotificationsByUserNotRead'");
    }

    @Override
    public Notification geNotificationById(Long id) {
        throw new UnsupportedOperationException("Unimplemented method 'geNotificationById'");
    }
    

}
