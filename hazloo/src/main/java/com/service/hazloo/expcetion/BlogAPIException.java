package com.service.hazloo.expcetion;


import org.springframework.http.HttpStatus;

public class BlogAPIException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	private HttpStatus status;
	private String message;
	
	
	public BlogAPIException(HttpStatus status, String message) {
		this.status = status;
		this.message = message;
	}
	
	public BlogAPIException(String message, HttpStatus status, String message1) {
		super(message);
		this.status = status;
		this.message = message1;
	}

	public HttpStatus getStatus() {
		return status;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(HttpStatus status) {
		this.status = status;
	}

	
	
}