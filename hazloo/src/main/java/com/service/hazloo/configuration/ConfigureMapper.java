package com.service.hazloo.configuration;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ConfigureMapper {

	@Bean public ModelMapper modelMapper() {
		return new ModelMapper();
	}
	
}