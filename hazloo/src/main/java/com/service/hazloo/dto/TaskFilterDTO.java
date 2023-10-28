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

    public TaskFilterDTO(String title, String status, Long project) {
        super();
        this.title = title;
        this.status = status;
        this.project = project;
    }    

}
