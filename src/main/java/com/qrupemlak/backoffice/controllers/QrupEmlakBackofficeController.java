package com.qrupemlak.backoffice.controllers;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.nibrahimli.database.generic.dao.CityDao;
import com.nibrahimli.database.generic.dao.CountryDao;
import com.nibrahimli.database.generic.dao.DistrictDao;
import com.nibrahimli.database.generic.dao.ImageDao;
import com.nibrahimli.database.generic.entity.City;
import com.nibrahimli.database.generic.entity.Country;
import com.nibrahimli.database.generic.entity.District;
import com.nibrahimli.database.qrupEmlak.dao.AnnouncementDao;
import com.nibrahimli.database.qrupEmlak.entity.Announcement;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.Currency;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.HomeType;
import com.qrupemlak.backoffice.data.AnnouncementInfo;

@Controller
public class QrupEmlakBackofficeController {
	
	private final static Logger logger = LoggerFactory.getLogger(QrupEmlakBackofficeController.class);
	
	@Autowired
	private AnnouncementDao announcementDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private CountryDao countryDao;
	
	@Autowired
	private CityDao cityDao;
	
	@Autowired
	private DistrictDao districtDao;
	
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
	
	@PostConstruct
	public List<Country> populateCountry(){
		return countryDao.getAll();
	}
	
	@PostConstruct
	public List<City> populateCity(){
		return cityDao.getAll();
	}
	
	@PostConstruct
	public List<District> populateDistrict(){
		return districtDao.getAll();
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
		Gson gson = new Gson();
		String countryJson = gson.toJson(populateCountry());
		if(id != null){
			Announcement announcement = announcementDao.getById(id);
			if(announcement != null){
				announcementInfo = announcementInfo.create(announcement);
			}
		}
		
		mav.addObject(announcementInfo);
		mav.addObject(countryJson);
		
		return mav;
	}
	@RequestMapping(value="/admin/announcement/update", method=RequestMethod.GET)
	public String updateArticle(@RequestParam("id") Long id,
			@RequestParam(value = "action", required = false) String action, RedirectAttributes redirectAttrs) throws Exception {
		try
		{
			logger.info( "Action " + action);
			redirectAttrs.addAttribute("id", id) ;
			Announcement announcement = announcementDao.getById(id);
			if(action.equals("delete")){
				announcementDao.delete(announcement);
				logger.info( "Announcement[id=" + announcement.getId() + "] deleted !");
				redirectAttrs.addFlashAttribute("infoMessage", "Announcement[id=" + announcement.getId() + "] deleted !") ;				
			}
			return "redirect:/admin/announcements";
		}
		catch(Exception e)
		{
			logger.error("Error : ", e);
			redirectAttrs.addFlashAttribute("errorMessage","An unexpected error occured !!!") ;
			return "redirect:/admin/announcements";
		}
	}
	
}
