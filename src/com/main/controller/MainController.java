package com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/back/main")
	public String main(){
		return "back/main/main";
	}
	
	@RequestMapping("/back/login")
	public String login(){
		return "back/main/login";
	}
	
	@RequestMapping("/back/welcome")
	public String welcome(){
		return "back/main/welcome";
	}
	
	@RequestMapping("/back/table")
	public String table_demo(){
		return "back/main/table_demo2";
	}
	

	
}
