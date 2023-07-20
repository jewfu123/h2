package com.example.demospring_h2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demospring_h2.repository.testRepository;

@Controller
@RequestMapping("/api")
public class MyController {
	
	@Autowired
	private testRepository testRep;

	@GetMapping("/hi")
	public String hello() {
		System.out.println("haha");
		testRep.findAll();
		return "index";
	}
}
