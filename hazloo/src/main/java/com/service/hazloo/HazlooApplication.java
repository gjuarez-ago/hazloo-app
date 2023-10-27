package com.service.hazloo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.service.hazloo.domain.Role;
import com.service.hazloo.repository.IRoleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;


@SpringBootApplication
public class HazlooApplication implements CommandLineRunner{

	@Autowired
	private IRoleRepository roleRepository;
	
	public static void main(String[] args) {
		SpringApplication.run(HazlooApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

		Role adminRole = new Role();
		adminRole.setName("ROLE_ADMIN");
		roleRepository.save(adminRole);
		
		Role userRole = new Role();
		userRole.setName("ROLE_ADMIN");
		roleRepository.save(userRole);
	
	}
	
	

}


