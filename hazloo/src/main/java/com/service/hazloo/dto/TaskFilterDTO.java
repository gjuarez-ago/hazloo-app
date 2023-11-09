package com.service.hazloo.dto;

import lombok.Data;

/**
 * @author gabriel.juarez
 *
 */
@Data
public class TaskFilterDTO {

    private String title;

    private String status;

    private Long project;

    private Long user;

    public TaskFilterDTO(String title, String status, Long project, Long user) {
        super();
        this.title = title;
        this.status = status;
        this.project = project;
        this.user = user;
    }    

}
