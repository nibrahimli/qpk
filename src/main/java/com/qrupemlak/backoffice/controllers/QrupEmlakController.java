package com.qrupemlak.backoffice.controllers;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QrupEmlakController {
	private final static Logger logger = LoggerFactory.getLogger(QrupEmlakController.class);
	
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home() throws IOException{
		logger.info("home page");
		return "home";
	}

}
