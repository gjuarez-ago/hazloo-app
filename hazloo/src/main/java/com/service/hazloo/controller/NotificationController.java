package com.service.hazloo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.service.hazloo.domain.Notification;
import com.service.hazloo.expcetion.GenericException;
import com.service.hazloo.service.INotificationService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "Notitication Controller V1")
@RestController
@RequestMapping("/api/notification")
public class NotificationController {

    @Autowired
    private INotificationService service;

    @ApiOperation(value = "Endpoint for notification by user readed")
	@GetMapping("/ads-by-user-r/{user}") 
    public List<Notification> getNotificationsByUserRead(@PathVariable("user") Long userId) {
        throw new UnsupportedOperationException("Unimplemented method 'getNotificationsByUserRead'");
    }
 
    @ApiOperation(value = "Endpoint for get notification by user not read")
	@GetMapping("/ads-by-user-nr/{user}") 
    public ResponseEntity<List<Notification>> getNotificationsByUserNotRead(@PathVariable("user") Long userId) {
        List<Notification> res = service.getNotificationsByUserNotRead(userId);
        return new ResponseEntity<>(res, HttpStatus.OK);
    }
    
    @ApiOperation(value = "Endpoint for get notification by id")
	@GetMapping("/notifications-by-user/{id}") 
    public ResponseEntity<Notification> geNotificationById(@PathVariable("id") Long id) throws GenericException {
        Notification res = service.geNotificationById(id);
        return new ResponseEntity<>(res, HttpStatus.OK);
    }

}
