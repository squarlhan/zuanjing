package com.oil_3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.oil_3.service.Oil_3Service;

@Controller
public class Oil_3Controller {
		@Autowired
		private Oil_3Service oil_3Service;
		
		
}
