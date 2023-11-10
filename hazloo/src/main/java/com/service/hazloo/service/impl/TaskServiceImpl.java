package com.service.hazloo.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.hazloo.domain.Log;
import com.service.hazloo.domain.Task;
import com.service.hazloo.domain.User;
import com.service.hazloo.dto.TaskDTO;
import com.service.hazloo.dto.TaskFilterDTO;
import com.service.hazloo.expcetion.GenericException;
import com.service.hazloo.repository.ILogRepository;
import com.service.hazloo.repository.ITaskRepository;
import com.service.hazloo.repository.IUserRepository;
import com.service.hazloo.service.ITaskService;

@Service
@Transactional
public class TaskServiceImpl implements ITaskService{

    @Autowired
    private ITaskRepository repository;

    @Autowired
    private IUserRepository userRepository;
    
    // @Autowired
    // private INotificationRepository notificationRepository;

    @Autowired 
    private ILogRepository logRepository;

    @Override
    public List<Task> getTasksByProjectAndUser(Long projectId, Long userId) {
        return repository.getTaskByUser(userId);
    }

    @Override
    public Task getTaskById(Long id) throws GenericException {
        return exisTask(id);
    }

    @Override
    public Task createTask(TaskDTO request) throws GenericException {

        Task task = new Task();
        User user = existUser(request.getUserId());

        task.setTitle(request.getTitle());
        task.setCategory(request.getCategory());
        task.setDescription(request.getDescription());
        task.setLabels(request.getLabels());
        task.setPrioridad(request.getPrioridad());
        task.setStatus(false);
        task.setUser(user);
        task.setRegCreatedBy(request.getUserId());
        task.setRegDateCreated(new Date());
        task.setRegBorrado(0);

        repository.save(task);        
        // generateLog("Se creo la tarea " + request.getTitle() , "Nueva tarea", "new", task, user);

        return task;
    }

    @Override
    public Task updateTask(Long id, TaskDTO request) throws GenericException {

        Task task = exisTask(id);
        User user = existUser(request.getUserId());


        task.setTitle(request.getTitle());
        task.setDescription(request.getDescription());
        task.setLabels(request.getLabels());
        task.setPrioridad(request.getPrioridad());
        task.setCategory(request.getCategory());

        task.setRegDateUpdated(new Date());
        task.setRegUpdateBy(id);

        repository.save(task);
        generateLog("Se actualizo la tarea " + request.getTitle() , "Nueva tarea", "update", task, user);

        return task;
    }

    @Override
    public Task deleteTask(Long id) throws GenericException {
        Task task = exisTask(id);
        deleteTask(task.getId());
        return task;
    }

    @Override
    public List<Task> filterTasksByParams(TaskFilterDTO params) {
        return repository.getTaskByParams(params.getTitle(), params.getCategory(), params.getUser(),params.isStatus());
    }

    @Override
    public Task solvedTask(boolean status, Long taskId) throws GenericException {
     
     Task task = exisTask(taskId);
     task.setStatus(status);
     task.setRegDateUpdated(new Date());
     generateLog("Se marco como solucionada la tarea " + task.getTitle() , "Tarea solucionada", "solved", task, task.getUser());

     return task;
    }

    private User existUser(Long userId) throws GenericException  {
        
        User user  = userRepository.getUserById(userId);
        
        if(user == null){
            throw new GenericException("No se encontro el recurso");
        }

        return user;
    }
    

    private Task exisTask(Long id) throws GenericException {

        Task e  = repository.getTaskById(id);
        
        if(e == null){
            throw new GenericException("No se encontro el recurso");
        }

        return e;
    }

    private Task validateTaskName(String title) throws GenericException {

        Task e  = repository.getTaskByTitle(title);
        
        if(e != null){
            throw new GenericException("Ya existe una tarea con este titulo");
        }

        return e;
    }


    private void generateLog(String description, String title, String type, Task task, User user   ) {

        Log log = new Log();
        log.setDescription(description);
        log.setTitle(title);
        log.setType(type);
        log.setUser(user);
        log.setTask(task);
        log.setRegDateCreated(new Date());
        logRepository.save(log);

    }

    // private void genarateNotification(String description, String title, String type, User user, Task task) {

    //     Notification notification = new Notification();

    //     notification.setDescription(description);
    //     notification.setStatus(0);
    //     notification.setTask(task);
    //     notification.setTitle(title);
    //     notification.setType(type);
    //     notification.setUser(user);
    //     notification.setRegDateCreated(new Date());

    //     notificationRepository.save(notification);
    // }


}
