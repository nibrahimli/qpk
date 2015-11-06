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
import com.nibrahimli.database.filter.EntityFilter;
import com.nibrahimli.database.qrupEmlak.dao.AnnouncementDao;
import com.nibrahimli.database.qrupEmlak.dao.CityDao;
import com.nibrahimli.database.qrupEmlak.dao.DistrictDao;
import com.nibrahimli.database.qrupEmlak.entity.Address;
import com.nibrahimli.database.qrupEmlak.entity.Announcement;
import com.nibrahimli.database.qrupEmlak.entity.City;
import com.nibrahimli.database.qrupEmlak.entity.District;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.Currency;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.HomeType;
import com.qrupemlak.backoffice.data.AnnouncementInfo;
import com.qrupemlak.backoffice.data.LocationInfo;
import com.qrupemlak.backoffice.data.SearchInfo;

@Controller
public class QrupEmlakController {
	private final static Logger logger = LoggerFactory.getLogger(QrupEmlakController.class);
	
	
	@Autowired
	private AnnouncementDao announcementDao;
	
	
	@Autowired
	private CityDao cityDao;
	
	@Autowired
	private DistrictDao districtDao;
	
	private List<City> allCity ;
	private List<District> allDistrict ;
	
	@ModelAttribute("homeTypeList")
	public List<HomeType> populateHomeTypeList(){
		return Arrays.asList(HomeType.values());
	}
	
	@ModelAttribute("currencyList")
	public List<Currency> populateCurrencyList(){
		return Arrays.asList(Currency.values());
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
	
	@ModelAttribute("locationInfoGson")
	public @ResponseBody String populateLocations(){
		LocationInfo locationInfo = new LocationInfo();		
		locationInfo.setCities(allCity);
		locationInfo.setDistricts(allDistrict);
		Gson gson = new Gson();
		String locationInfoGson = gson.toJson(locationInfo);
		return locationInfoGson;
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView home(ModelAndView mav) throws IOException{
		List<Announcement> announcementList = announcementDao.getAllDistinctOrderByDate();
		mav.addObject("announcementList", announcementList);
		mav.addObject("searchInfo", new SearchInfo());
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public ModelAndView homeSearch(@ModelAttribute(value = "searchInfo") SearchInfo searchInfo, ModelAndView mav) throws IOException{		
		System.out.println(searchInfo.toString());		
		EntityFilter entityFilter = searchInfo.build();
		List<Announcement> announcementList = announcementDao.getAll(entityFilter);
		mav.addObject("announcementList", announcementList);
		mav.setViewName("advancedSearch");
		return mav;
	}
	
	@RequestMapping(value="/announcement/{fakeId}", method=RequestMethod.GET)
	public ModelAndView announcement(@PathVariable String fakeId, ModelAndView mav){
		Long id = Long.parseLong(fakeId.replaceAll("[^0-9]", "")); 
		AnnouncementInfo announcementInfo = new AnnouncementInfo();
		Announcement announcement = null ;
		Address address = null;
		if(id != null){
			announcement = announcementDao.getById(id);
			logger.info("announcement id {}", id);
			if(announcement != null){
				announcementInfo = announcementInfo.create(announcement);
				address = announcement.getAddress();
				Integer viewsNumber = announcement.getViewsNumber();
				if(viewsNumber == null)
					viewsNumber = 0;
				viewsNumber++;
				announcement.setViewsNumber(viewsNumber);
				announcementDao.saveOrUpdate(announcement);
			}
			
		}
		mav.addObject("address", address);
		mav.addObject(announcementInfo);
		mav.setViewName("announcement");
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
