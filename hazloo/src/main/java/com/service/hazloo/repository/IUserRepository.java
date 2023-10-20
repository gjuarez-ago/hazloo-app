package com.service.hazloo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.service.hazloo.domain.User;

public interface IUserRepository extends JpaRepository<User, Long> {

	User findUserByUsername(String username);
	
	Boolean existsUserByUsername(String username);
	
}