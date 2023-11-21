package com.service.hazloo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.service.hazloo.domain.User;
import com.service.hazloo.dto.LoginDTO;
import com.service.hazloo.dto.RegisterDTO;
import com.service.hazloo.dto.ResetPasswordDTO;
import com.service.hazloo.response.JwtAuthResponse;
import com.service.hazloo.security.JwtProvider;
import com.service.hazloo.service.IUserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


@Api(value = "Auth Controller V1")
@RestController
@RequestMapping("/api/auth")
public class AuthController {
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private JwtProvider jwtProvider;	
	
	@Autowired 
	private IUserService userService;
	
	@ApiOperation(value = "Endpoint for signin")
	@PostMapping("/signin")
	public ResponseEntity<JwtAuthResponse> createComment(@RequestBody LoginDTO loginDTO) {
		
		Authentication authentication =  authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginDTO.getUsername(), loginDTO.getPassword()));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		// Get token
		String token = jwtProvider.generateToken(authentication);
	
		return new ResponseEntity<>(new JwtAuthResponse(token), HttpStatus.CREATED);
	}
	
	@ApiOperation(value = "Endpoint for register user")
	@PostMapping("/register") 
	public ResponseEntity<User> registerUser(@RequestBody RegisterDTO params) throws Exception {
		User user = userService.register(params);
		return new ResponseEntity<>(user, HttpStatus.CREATED);
	}

	@ApiOperation(value = "Endpoint for reset password")
	@PostMapping("/reset-password") 
	public ResponseEntity<User> resetPassword(@RequestBody ResetPasswordDTO params) throws Exception {
		User user = userService.resetPassword(params);
		return new ResponseEntity<>(user, HttpStatus.CREATED);
	}

	@ApiOperation(value = "Endpoint for reset password")
	@PostMapping("/recovery-password/{username}") 
	public ResponseEntity<User> recoveryPassword(@PathVariable("username") String params) throws Exception {
		User user = userService.recoveryPassword(params);
		return new ResponseEntity<>(user, HttpStatus.CREATED);
	}
	
	

}