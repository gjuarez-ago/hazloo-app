package com.service.hazloo.dto;

import java.util.Date;
import org.springframework.http.HttpStatus;
import com.fasterxml.jackson.annotation.JsonFormat;

public class HttpResponse {
    
   @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM-dd-yyyy hh:mm:ss", timezone = "America/Mexico_City")
    private Date timeStamp;
    private int httpStatusCode; // 200, 201, 400, 500
    private HttpStatus httpStatus;
    private String message;
    private String code;

    // Constructor never used. Can be (and should be) deleted
    public HttpResponse() {}

    public HttpResponse(int httpStatusCode, HttpStatus httpStatus, String message, String code) {
        this.timeStamp = new Date();
        this.httpStatusCode = httpStatusCode;
        this.httpStatus = httpStatus;
        this.message = message;
        this.code = code;
    }

//    public HttpResponse(String code, Map<String, Object> data) {
//        this.timeStamp = new Date();
//        this.httpStatusCode = httpStatusCode;
//        this.httpStatus = httpStatus;
//        this.message = message;
//        this.code = code;
//        this.data = data;
//    }

    
    
    public Date getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(Date timeStamp) {
        this.timeStamp = timeStamp;
    }

    public int getHttpStatusCode() {
        return httpStatusCode;
    }

    public void setHttpStatusCode(int httpStatusCode) {
        this.httpStatusCode = httpStatusCode;
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public void setHttpStatus(HttpStatus httpStatus) {
        this.httpStatus = httpStatus;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

	

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}


	
	
    
    

}


