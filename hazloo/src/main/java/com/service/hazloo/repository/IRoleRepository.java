package com.service.hazloo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.service.hazloo.domain.Role;


/**
 * @author gabriel.juarez
 *
 */
public interface IRoleRepository extends JpaRepository<Role, Long>{

	Role findRoleByName(String name);
	
}