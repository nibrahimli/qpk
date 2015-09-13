package com.qrupemlak.backoffice.controllers;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nibrahimli.database.generic.dao.ImageDao;
import com.nibrahimli.database.qrupEmlak.dao.AnnouncementDao;
import com.nibrahimli.database.qrupEmlak.entity.Announcement;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.Currency;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.HomeType;
import com.qrupemlak.backoffice.data.AnnouncementInfo;

@Controller
public class QrupEmlakController {
	
	private final static Logger logger = LoggerFactory.getLogger(QrupEmlakController.class);
	
	@Autowired
	private AnnouncementDao announcementDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@ModelAttribute("currenyList")
	public List<Currency> populateCurrencyList(){
		return Arrays.asList(Currency.values());
	}
	
	@ModelAttribute("homeTypeList")
	public List<HomeType> populateHomeTypeList(){
		return Arrays.asList(HomeType.values());
	}
	
	@ModelAttribute("liftValues")
	public List<Boolean> populateLiftList(){
		return Arrays.asList(true, false);
	}
	
	@RequestMapping(value="/admin/announcements", method=RequestMethod.GET)
	public ModelAndView announcements(ModelAndView mav) throws IOException{
		
		List<Announcement> announcementList = announcementDao.getAll();
		mav.addObject(announcementList);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/announcement", method=RequestMethod.GET)
	public ModelAndView editAnnouncement(@RequestParam(value="id", required=false) Long id, ModelAndView mav){
		
		AnnouncementInfo announcementInfo = new AnnouncementInfo();
		
		if(id != null){
			Announcement announcement = announcementDao.getById(id);
			if(announcement != null)
				announcementInfo = announcementInfo.create(announcement);
		}
		mav.addObject(announcementInfo);
		
		return mav;
	}
}
