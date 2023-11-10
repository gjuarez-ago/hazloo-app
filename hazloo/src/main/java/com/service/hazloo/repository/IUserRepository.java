package com.service.hazloo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.service.hazloo.domain.User;

public interface IUserRepository extends JpaRepository<User, Long> {

	User findUserByUsername(String username);
	
	Boolean existsUserByUsername(String username);
	
	@Query(value = "SELECT * FROM cat_user WHERE id = :id",nativeQuery = true)
	User getUserById(@Param("id") Long id); 
    
}