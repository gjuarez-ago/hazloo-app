package com.service.hazloo.service.impl;

import java.util.Collections;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.service.hazloo.domain.Role;
import com.service.hazloo.domain.User;
import com.service.hazloo.dto.RegisterDTO;
import com.service.hazloo.dto.ResetPasswordDTO;
import com.service.hazloo.repository.IRoleRepository;
import com.service.hazloo.repository.IUserRepository;
import com.service.hazloo.service.IUserService;


@Service
public class UserServiceImpl implements IUserService{
	
	private IUserRepository userRepository;
	private IRoleRepository roleRepository;
	private BCryptPasswordEncoder passwordEncoder;
	
	public UserServiceImpl (IUserRepository userRepository, IRoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.passwordEncoder = passwordEncoder;
	}


	@Override
	public User register(RegisterDTO userDTO) throws Exception {
		
		validateUsername(userDTO.getUsername());
		User user =  new User();
		user.setNames(userDTO.getNames());
		user.setSurnames(userDTO.getSurnames());
		user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
		user.setUsername(userDTO.getUsername());
		Role role = roleRepository.findRoleByName("ROLE_USER");
		user.setRoles(Collections.singleton(role));
		userRepository.save(user);
	
		return user;
	}
	
	
	private User validateUsername(String username) throws Exception {
		
		User user = userRepository.findUserByUsername(username);
		
		if(user != null) {
		 throw new Exception("Usernarme already exist");
		}
		
		return user;
	}


	@Override
	public User resetPassword(ResetPasswordDTO username) throws Exception {
		throw new UnsupportedOperationException("Unimplemented method 'resetPassword'");
	}


	@Override
	public User recoveryPassword(String username) throws Exception {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Unimplemented method 'recoveryPassword'");
	}


	@Override
	public User getUserByUSername(String username) {
		User user = userRepository.findUserByUsername(username);
		return user;
	}



		
}