package com.service.hazloo.dto;

import lombok.Data;

/**
 * @author gabriel.juarez
 *
 */
@Data
public class TaskDTO {

    private String title;

    private String description;

    private Long category;

    private String[] labels;

    private Long prioridad;

    private Long userId;
    
}
