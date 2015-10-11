package com.qrupemlak.backoffice.controllers;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nibrahimli.database.qrupEmlak.dao.AnnouncementDao;
import com.nibrahimli.database.qrupEmlak.entity.Announcement;

@Controller
public class QrupEmlakController {
	private final static Logger logger = LoggerFactory.getLogger(QrupEmlakController.class);
	
	
	@Autowired
	private AnnouncementDao announcementDao;
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView home(ModelAndView mav) throws IOException{
		List<Announcement> announcementList = announcementDao.getAllDistinctOrderByDate();
		mav.addObject("announcementList", announcementList);
		mav.setViewName("home");
		return mav;
	}

}
