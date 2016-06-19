package com.qrupemlak.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.mail.internet.MimeMessage;
import javax.xml.bind.JAXBException;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.nibrahimli.database.filter.EntityFilter;
import com.nibrahimli.database.order.EntityOrder;
import com.nibrahimli.database.order.Order;
import com.nibrahimli.database.qrupEmlak.dao.AnnouncementDao;
import com.nibrahimli.database.qrupEmlak.dao.CityDao;
import com.nibrahimli.database.qrupEmlak.dao.DistrictDao;
import com.nibrahimli.database.qrupEmlak.dao.QrupEmlakSitemapDao;
import com.nibrahimli.database.qrupEmlak.entity.Address;
import com.nibrahimli.database.qrupEmlak.entity.Announcement;
import com.nibrahimli.database.qrupEmlak.entity.City;
import com.nibrahimli.database.qrupEmlak.entity.District;
import com.nibrahimli.database.qrupEmlak.entity.QrupEmlakSitemap;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.Currency;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.HomeType;
import com.qrupemlak.data.AnnouncementInfo;
import com.qrupemlak.data.Captcha;
import com.qrupemlak.data.ContactInfo;
import com.qrupemlak.data.LocationInfo;
import com.qrupemlak.data.SearchInfo;
import com.qrupemlak.data.SitemapURLSet;

@Controller
public class QrupEmlakController {
	private final static Logger logger = LoggerFactory.getLogger(QrupEmlakController.class);
	
	static final String FROM = "info@qrupemlak.com";
	static final String TO = "info@qrupemlak.com";
	
	@Autowired
	private AnnouncementDao announcementDao;
	
	@Autowired
	private CityDao cityDao;
	
	@Autowired
	private DistrictDao districtDao;
	
	@Autowired
	private QrupEmlakSitemapDao qrupEmlakSitemapDao;
	
	@Autowired
	private JavaMailSender javaMailSender ;
	
	@Autowired
	private CacheManager cacheManager;
	
	@Autowired
	private Captcha captcha;
	
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
		List<Announcement> announcementList = featuredAnnouncements();
		mav.addObject("announcementList", announcementList);
		mav.addObject("searchInfo", new SearchInfo());
		mav.setViewName("home");
		return mav;
	}

	@RequestMapping(value="/elan/{fakeId}", method=RequestMethod.GET)
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
		mav.setViewName("elan");
		return mav;
	}
	
	@RequestMapping(value="/axtaris", method=RequestMethod.GET)
	public ModelAndView advancedSearchGet(ModelAndView mav) throws IOException{
		List<Announcement> announcementList = featuredAnnouncements();
		mav.addObject("searchInfo", new SearchInfo());
		mav.addObject("announcementList", announcementList);		
		return mav;
	}
	
	@RequestMapping(value="/axtaris", method=RequestMethod.POST)
	public ModelAndView advancedSearchPost(@ModelAttribute(value = "searchInfo") SearchInfo searchInfo, ModelAndView mav) throws IOException{
		List<Announcement> announcementList = filterAnnouncements(searchInfo);
		mav.addObject("searchInfo", searchInfo);
		mav.addObject("announcementList", announcementList);
		mav.addObject("searchIcon", true);
		return mav;
	}
	
	@RequestMapping(value="/kontakt/{title}", method=RequestMethod.GET)
	public ModelAndView contactForAnnouncement(@PathVariable String title, ModelAndView mav){
		logger.info("announcement title {}", title);
		ContactInfo contactInfo = new ContactInfo() ;
		contactInfo.setSubject("http://qrupemlak.com/elan/"+title);		
		mav.addObject("readonly", "true");
		mav.addObject("contactInfo", contactInfo);
		mav.addObject("captchaSiteKey", captcha.getSiteKey());
		mav.setViewName("kontakt");
		return mav;
	}
	
	@RequestMapping(value="/kontakt", method=RequestMethod.GET)
	public ModelAndView contact(ModelAndView mav){
		logger.info("contact page");
		mav.addObject("contactInfo", new ContactInfo());
		mav.addObject("captchaSiteKey", captcha.getSiteKey());
		return mav;
	}
	
	@RequestMapping(value="/kontakt", method=RequestMethod.POST)
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
			return "redirect:/kontakt";
		}	
		
		return "redirect:/kontakt";
	}
	

	@RequestMapping(value="/kontakt/captcha", method=RequestMethod.POST)
	public @ResponseBody String captchaPost(@RequestParam("response") String response) throws Exception{
		if(StringUtils.isNoneEmpty(response)){
			CloseableHttpClient httpclient = HttpClients.createDefault();
			HttpPost httpPost = new HttpPost("https://www.google.com/recaptcha/api/siteverify");
			List <NameValuePair> nvps = new ArrayList <NameValuePair>();
			nvps.add(new BasicNameValuePair("secret", captcha.getSecretKey()));
			nvps.add(new BasicNameValuePair("response", response));
			httpPost.setEntity(new UrlEncodedFormEntity(nvps));
			CloseableHttpResponse recaptchaResponse = httpclient.execute(httpPost);
			try {
			    logger.info("Google recaptcha siteverify response {}", recaptchaResponse.getStatusLine());
			    HttpEntity entity = recaptchaResponse.getEntity();
			    return EntityUtils.toString(entity, "UTF-8");			    			   
			} finally {
				recaptchaResponse.close();
			}
		}
		
		throw new Exception();
	}
	
	@RequestMapping(value="/sitemap", method=RequestMethod.GET)
	public @ResponseBody SitemapURLSet sitemap() throws JAXBException{
		logger.info("Sitemap");
		List<QrupEmlakSitemap> qeURLs = qrupEmlakSitemapDao.getAll();
		return SitemapURLSet.build(qeURLs);
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

	private List<Announcement> featuredAnnouncements() {
		List<Announcement> announcementList = new ArrayList<Announcement>();
		List<Announcement> featuredAnnList = announcementDao.getFeaturedAnnouncements();
		announcementList.addAll(featuredAnnList);
		if(CollectionUtils.isEmpty(announcementList) || announcementList.size() < 50){
			List<Announcement> nonFeaturedAnnList = announcementDao.getNonFeaturedAnnouncements();
			announcementList.addAll(nonFeaturedAnnList);
		}
		return announcementList;
	}	
}
