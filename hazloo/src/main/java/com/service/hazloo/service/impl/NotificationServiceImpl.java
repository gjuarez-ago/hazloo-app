package com.service.hazloo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.hazloo.domain.Notification;
import com.service.hazloo.expcetion.GenericException;
import com.service.hazloo.repository.INotificationRepository;
import com.service.hazloo.service.INotificationService;

@Service
@Transactional
public class NotificationServiceImpl implements INotificationService {

    @Autowired
    INotificationRepository repository;

    @Override
    public List<Notification> getNotificationsByUserRead(Long userId) {
        return repository.getNotificationByUserAndStatus(userId, 1);
    }

    @Override
    public List<Notification> getNotificationsByUserNotRead(Long userId) {
        return repository.getNotificationByUserAndStatus(userId, 0);
    }

    @Override
    public Notification geNotificationById(Long id) throws GenericException {
        return existAD(id);
    }

    private Notification existAD(Long id) throws GenericException {
        Notification e = repository.getNotificationById(id);

        if (e == null) {
            throw new GenericException("No se encontro el recurso");
        }

        return e;
    }

}
