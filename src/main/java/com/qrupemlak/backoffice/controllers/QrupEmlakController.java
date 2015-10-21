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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.nibrahimli.database.qrupEmlak.dao.AnnouncementDao;
import com.nibrahimli.database.qrupEmlak.dao.CityDao;
import com.nibrahimli.database.qrupEmlak.dao.CountryDao;
import com.nibrahimli.database.qrupEmlak.dao.DistrictDao;
import com.nibrahimli.database.qrupEmlak.entity.Announcement;
import com.nibrahimli.database.qrupEmlak.entity.City;
import com.nibrahimli.database.qrupEmlak.entity.Country;
import com.nibrahimli.database.qrupEmlak.entity.District;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.HomeType;
import com.qrupemlak.backoffice.data.AnnouncementInfo;
import com.qrupemlak.backoffice.data.LocationInfo;

@Controller
public class QrupEmlakController {
	private final static Logger logger = LoggerFactory.getLogger(QrupEmlakController.class);
	
	
	@Autowired
	private AnnouncementDao announcementDao;
	
	@Autowired
	private CountryDao countryDao;
	
	@Autowired
	private CityDao cityDao;
	
	@Autowired
	private DistrictDao districtDao;
	
	
	private List<Country> allCountry ;
	private List<City> allCity ;
	private List<District> allDistrict ;
	
	@ModelAttribute("homeTypeList")
	public List<HomeType> populateHomeTypeList(){
		return Arrays.asList(HomeType.values());
	}
	
	@PostConstruct
	public List<Country> getAllCountry(){
		allCountry = countryDao.getAll(); 
		return allCountry;
	}
	
	@PostConstruct
	public List<City> getAllCity(){
		allCity = cityDao.getAll(); 
		return allCity;
	}
	
	@PostConstruct
	public List<District> getAllDistrict(){
		allDistrict = districtDao.getAll();
		return allDistrict;
	}
	
	@ModelAttribute("locationsGson")
	public @ResponseBody String populateLocations(){
		LocationInfo locationInfo = new LocationInfo();
		locationInfo.setCountries(allCountry);
		locationInfo.setCities(allCity);
		locationInfo.setDistricts(allDistrict);
		Gson gson = new Gson();
		String locationsGson = gson.toJson(locationInfo);
		return locationsGson;
	}
	
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
