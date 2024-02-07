package com.service.hazloo.service;

import org.springframework.stereotype.Component;

import com.service.hazloo.domain.User;
import com.service.hazloo.dto.RegisterDTO;
import com.service.hazloo.dto.ResetPasswordDTO;

@Component
public interface IUserService {
	
	User register(RegisterDTO user) throws Exception;

	User resetPassword(ResetPasswordDTO username) throws Exception;

	User recoveryPassword(String username) throws Exception;
	
	User getUserByUSername(String username);

}