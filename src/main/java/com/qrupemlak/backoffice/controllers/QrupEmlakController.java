package com.qrupemlak.backoffice.controllers;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.mail.internet.MimeMessage;

import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.nibrahimli.database.filter.EntityFilter;
import com.nibrahimli.database.filter.Filters;
import com.nibrahimli.database.order.EntityOrder;
import com.nibrahimli.database.order.Order;
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
import com.qrupemlak.backoffice.data.ContactInfo;
import com.qrupemlak.backoffice.data.LocationInfo;
import com.qrupemlak.backoffice.data.SearchInfo;

@Controller
public class QrupEmlakController {
	private final static Logger logger = LoggerFactory.getLogger(QrupEmlakController.class);
	
	static final String FROM = "admin@qrupemlak.com";
	static final String TO = "azgroupemlak@gmail.com";
	
	@Autowired
	private AnnouncementDao announcementDao;
	
	@Autowired
	private CityDao cityDao;
	
	@Autowired
	private DistrictDao districtDao;
	
	@Autowired
	private JavaMailSender javaMailSender ;
	
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
		List<Announcement> announcementList = featuredAnnouncement();
		mav.addObject("announcementList", announcementList);
		mav.addObject("searchInfo", new SearchInfo());
		mav.setViewName("home");
		return mav;
	}

	@RequestMapping(value="/announcement/{fakeId}", method=RequestMethod.GET)
	public ModelAndView announcement(@PathVariable String fakeId, ModelAndView mav){
		fakeId = fakeId.split("---")[1];
		Long id = Long.parseLong(fakeId.replaceAll("[^0-9]", "")); 
		AnnouncementInfo announcementInfo = new AnnouncementInfo();
		Announcement announcement = null ;
		Address address = null;
		List<Announcement> relatedAnnList = null;
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
				relatedAnnList = relatedAnnouncement(announcementInfo);
			}
			
		}
		mav.addObject("address", address);
		mav.addObject(announcementInfo);
		mav.addObject("relatedAnnList", relatedAnnList);
		mav.setViewName("announcement");
		return mav;
	}
	
	@RequestMapping(value="/advancedSearch", method=RequestMethod.GET)
	public ModelAndView advancedSearchGet(ModelAndView mav) throws IOException{
		List<Announcement> announcementList = featuredAnnouncement();
		mav.addObject("searchInfo", new SearchInfo());
		mav.addObject("announcementList", announcementList);		
		return mav;
	}
	
	@RequestMapping(value="/advancedSearch", method=RequestMethod.POST)
	public ModelAndView advancedSearchPost(@ModelAttribute(value = "searchInfo") SearchInfo searchInfo, ModelAndView mav) throws IOException{
		List<Announcement> announcementList = filterAnnouncements(searchInfo);
		mav.addObject("searchInfo", searchInfo);
		mav.addObject("announcementList", announcementList);
		mav.addObject("searchIcon", true);
		return mav;
	}
	
	@RequestMapping(value="/contact/{titleId}", method=RequestMethod.GET)
	public ModelAndView contactForAnnouncement(@PathVariable String titleId, ModelAndView mav){
		logger.info("contact page");
		ContactInfo contactInfo = new ContactInfo() ;
		contactInfo.setSubject(titleId);
		mav.addObject("contactInfo", contactInfo);
		mav.setViewName("contact");
		return mav;
	}
	
	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public ModelAndView contact(ModelAndView mav){
		logger.info("contact page");
		mav.addObject("contactInfo", new ContactInfo());
		return mav;
	}
	
	@RequestMapping(value="/contact", method=RequestMethod.POST)
	public String contactPost(ContactInfo contactInfo, RedirectAttributes redirectAttrs, ModelAndView mav){

		MimeMessage message = javaMailSender.createMimeMessage();
		
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			helper.setFrom(FROM);
			helper.setTo(TO);
			helper.setSubject(contactInfo.getSubject());
			helper.setText("From : "+ contactInfo.getEmail()+" Telephone : "+contactInfo.getTelephon()+"\nMessage : "+contactInfo.getMessage());
			
			javaMailSender.send(message);
			redirectAttrs.addFlashAttribute("infoMessage", "<b>Mesajınız uğurla göndərildi!</b> Tezliklə sizinlə əlaqə saxlanılacaq.") ;
			
		} catch (Exception e) {
			logger.error("error {}", e);
			redirectAttrs.addFlashAttribute("errorMessage", "Gözlənilməz bir səhv meydana gəldi.") ;
			return "redirect:/contact";
		}	
		
		return "redirect:/contact";
	}
	
	private List<Announcement> filterAnnouncements(SearchInfo searchInfo) {
		EntityFilter entityFilter = searchInfo.build();
		List<Announcement> announcementList = announcementDao.getAll(entityFilter);
		return announcementList;
	}
	
	private List<Announcement> relatedAnnouncement(AnnouncementInfo announcementInfo){
		
		EntityFilter entityFilter = announcementInfo.build();
		EntityOrder entityOrder = EntityOrder.builder();
		List<Announcement> announcementList = announcementDao.getAll(entityFilter, entityOrder.add(Order.desc("viewsNumber")));
		return announcementList ;
	}

	private List<Announcement> featuredAnnouncement() {
		EntityFilter entityFilter = EntityFilter.builder();
		EntityOrder entityOrder = EntityOrder.builder();
		List<Announcement> announcementList = announcementDao.getAll(entityFilter.add(Filters.eq("popular", true)), entityOrder.add(Order.desc("viewsNumber")));
		if(CollectionUtils.isEmpty(announcementList) || announcementList.size() < 50){
			announcementList.addAll(announcementDao.getAll(EntityFilter.builder().add(Filters.eq("popular", false)), entityOrder));
		}
		return announcementList;
	}
}
