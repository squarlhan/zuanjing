package com.pump.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PumpController {
	@RequestMapping("back/pumpAdd")
	public String pumpAdd(){
		return "back/pump/pumpAdd";
	}
		
	@RequestMapping("back/pumpAddDo")
	public String pumpAddDo(){
		return "back/main/message";
	}
	
}
