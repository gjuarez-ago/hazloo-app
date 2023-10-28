package com.service.hazloo.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import lombok.Data;

@Entity
@Data
@Table(name = "tbl_tareas")
public class Task implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false, updatable = false)
	private Long id;
	
    private String title;

    private String description;

    private Long category;

    private String[] labels;

    private Long prioridad;

	private boolean status;

	@ManyToOne(optional = false, cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
	private User user;

	@JsonProperty(access = Access.WRITE_ONLY)
	private Date regDateCreated;

	@JsonProperty(access = Access.WRITE_ONLY)
	private Long regCreatedBy;

	@JsonProperty(access = Access.WRITE_ONLY)
	private Date regDateUpdated;

	@JsonProperty(access = Access.WRITE_ONLY)
	private Long regUpdateBy;

	@JsonProperty(access = Access.WRITE_ONLY)
	@Column(columnDefinition = "integer default 0")
	private int regBorrado;
	



}
