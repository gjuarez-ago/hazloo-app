package com.service.hazloo.service;

import org.springframework.stereotype.Component;

import com.service.hazloo.domain.User;
import com.service.hazloo.dto.RegisterDTO;

@Component
public interface IUserService {
	
	User register(RegisterDTO user) throws Exception;

	User resetPassword(String username) throws Exception;

}