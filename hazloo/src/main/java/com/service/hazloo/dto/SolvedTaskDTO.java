package com.service.hazloo.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SolvedTaskDTO implements Serializable{

    private boolean status;

    private Long taskId;

    public SolvedTaskDTO(boolean status, Long taskId) {
        super();
        this.status = status;
        this.taskId = taskId;
    }

}
