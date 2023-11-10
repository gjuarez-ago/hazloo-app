package com.service.hazloo.dto;

import lombok.Data;

/**
 * @author gabriel.juarez
 *
 */
@Data
public class TaskFilterDTO {

    private String title;

    private boolean status;

    private Long category;

    private Long user;

    public TaskFilterDTO(String title, boolean status, Long category, Long user) {
        super();
        this.title = title;
        this.status = status;
        this.category = category;
        this.user = user;
    }    

}
