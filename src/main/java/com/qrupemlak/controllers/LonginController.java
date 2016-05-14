package com.qrupemlak.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LonginController {

	@RequestMapping(value="/admin")
	public String home(ModelAndView mav) {
		return "/admin/home";
	}
	
	@RequestMapping(value="/admin/login")
	public String login(ModelAndView mav) {
		return "/admin/login";
	}
	
	@RequestMapping(value="/admin/loginfailed")
	public String loginerror(ModelMap model) {

		model.addAttribute("error", "true");
		return "/admin/login";
	}
}
