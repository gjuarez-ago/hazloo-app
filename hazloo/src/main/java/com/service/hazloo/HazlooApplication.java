package com.service.hazloo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import java.util.Arrays;


@SpringBootApplication
public class HazlooApplication extends SpringBootServletInitializer{


	public static void main(String[] args) {
		SpringApplication.run(HazlooApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder  appliction) {
		return appliction.sources(HazlooApplication.class);
	}

	@Bean
	public CorsFilter corsFilter() {
		
		UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
		CorsConfiguration corsConfiguration = new CorsConfiguration();
	
		corsConfiguration.setAllowedOrigins(Arrays.asList("*"));

		urlBasedCorsConfigurationSource.registerCorsConfiguration("/**", corsConfiguration.applyPermitDefaultValues());
		return new CorsFilter(urlBasedCorsConfigurationSource);
	}


}


