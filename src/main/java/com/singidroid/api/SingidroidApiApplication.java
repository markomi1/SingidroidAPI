package com.singidroid.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class SingidroidApiApplication {


	public static void main(String[] args) {
		SpringApplication.run(SingidroidApiApplication.class, args);
	}

}

