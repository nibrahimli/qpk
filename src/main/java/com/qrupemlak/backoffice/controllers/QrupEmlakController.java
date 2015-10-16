package com.qrupemlak.backoffice.controllers;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nibrahimli.database.qrupEmlak.dao.AnnouncementDao;
import com.nibrahimli.database.qrupEmlak.entity.Announcement;
import com.qrupemlak.backoffice.data.AnnouncementInfo;

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
	
	@RequestMapping(value="/announcement/{fakeId}", method=RequestMethod.GET)
	public ModelAndView announcement(@PathVariable String fakeId, ModelAndView mav){
		Long id = Long.parseLong(fakeId.replaceAll("[^0-9]", "")); 
		AnnouncementInfo announcementInfo = new AnnouncementInfo();
		Announcement announcement = null ;
		if(id != null){
			announcement = announcementDao.getById(id);
			logger.info("announcement id {}", id);
			if(announcement != null)
				announcementInfo = announcementInfo.create(announcement);
			
		}
		mav.setViewName("announcement");
		mav.addObject(announcementInfo);
		if(announcement != null)
			mav.addObject("addressInfo", announcement.getAddress());
		return mav;
	}
	
	@RequestMapping(value="/advancedSearch", method=RequestMethod.GET)
	public ModelAndView advancedSearch(ModelAndView mav) throws IOException{
		List<Announcement> announcementList = announcementDao.getAllDistinctOrderByDate();
		mav.addObject("announcementList", announcementList);		
		return mav;
	}
	
	
	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public ModelAndView contact(ModelAndView mav){
		
		logger.info("contact page");
		
		return mav;
	}
}
