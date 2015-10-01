package com.qrupemlak.backoffice.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.nibrahimli.database.image.dao.ImageDao;
import com.nibrahimli.database.image.entity.Image;
import com.nibrahimli.database.qrupEmlak.dao.AddressDao;
import com.nibrahimli.database.qrupEmlak.dao.AnnouncementDao;
import com.nibrahimli.database.qrupEmlak.dao.CityDao;
import com.nibrahimli.database.qrupEmlak.dao.CountryDao;
import com.nibrahimli.database.qrupEmlak.dao.DistrictDao;
import com.nibrahimli.database.qrupEmlak.entity.Address;
import com.nibrahimli.database.qrupEmlak.entity.Announcement;
import com.nibrahimli.database.qrupEmlak.entity.City;
import com.nibrahimli.database.qrupEmlak.entity.Country;
import com.nibrahimli.database.qrupEmlak.entity.District;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.Currency;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.HomeType;
import com.qrupemlak.backoffice.data.AnnouncementInfo;
import com.qrupemlak.backoffice.data.LocationInfo;

@Controller
public class QrupEmlakBackofficeController {
	
	private final static Logger logger = LoggerFactory.getLogger(QrupEmlakBackofficeController.class);

	private static final String IMAGE_PATH = "/home/nibrahim/qrupEmlakImages/";
//	private static final String IMAGE_PATH = "/home/ec2-user/qrupEmlakImages/";
	
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
	
	@Autowired
	private AddressDao addressDao;
	
	private List<Country> allCountry ;
	private List<City> allCity ;
	private List<District> allDistrict ;
	
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
		
	@RequestMapping(value="/admin/announcements", method=RequestMethod.GET)
	public ModelAndView announcements(ModelAndView mav) throws IOException{
		
		List<Announcement> announcementList = announcementDao.getAllDistinctOrderByDate();
		mav.addObject(announcementList);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/announcement", method=RequestMethod.GET)
	public ModelAndView editAnnouncement(@RequestParam(value="id", required=false) Long id, ModelAndView mav){
		
		AnnouncementInfo announcementInfo = new AnnouncementInfo();
		Gson gson = new Gson();
		String addressInfoGson = null ;
		if(id != null){
			Announcement announcement = announcementDao.getById(id);
			if(announcement != null){
				announcementInfo = announcementInfo.create(announcement);
				addressInfoGson = gson.toJson(announcementInfo.getAddressInfo());
			}
		}
		
		mav.addObject("addressInfoGson", addressInfoGson);
		mav.addObject("announcementInfo", announcementInfo);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/announcement", method=RequestMethod.POST)
	public String createAnnouncement(@ModelAttribute(value = "announcementInfo") AnnouncementInfo announcementInfo, RedirectAttributes redirectAttrs) throws Exception {

		try
		{
			Announcement announcement = new Announcement() ;
			Address address = new Address();
			if(StringUtils.isNotBlank(announcementInfo.getTitle()) && StringUtils.isNotBlank(announcementInfo.getDescription())){
				// update or save address
				if(announcementInfo.getAddressInfo().getId() != null)
					address = addressDao.getById(announcementInfo.getAddressInfo().getId());									
				address.setNumber(announcementInfo.getAddressInfo().getNumber());
				address.setStreet(announcementInfo.getAddressInfo().getStreet());
				Country country = countryDao.getById(announcementInfo.getAddressInfo().getCountry());
				City city = cityDao.getById(announcementInfo.getAddressInfo().getCity());
				District district = districtDao.getById(announcementInfo.getAddressInfo().getDistrict());
				address.setCountry(country);
				address.setCity(city);
				address.setDistrict(district);				
				addressDao.saveOrUpdate(address);
				
				// save image in path
				Set<Image> images = saveImages(announcementInfo, address.getId());
				
				if(announcementInfo.getId() != null){
					Announcement ann = announcementDao.getById(announcementInfo.getId());
					Set<Image> imgs = ann.getImages();
					if(CollectionUtils.isNotEmpty(imgs))
						images.addAll(imgs);
				}
				
				// update announcement
				announcement = announcementInfo.update(announcement, address, images) ;
				announcementDao.saveOrUpdate(announcement);
				redirectAttrs.addAttribute("id", announcement.getId()) ;
				redirectAttrs.addFlashAttribute("infoMessage", "Announcement[id=" + announcement.getId() + "] saved !") ;
			}
			else 
			{
				redirectAttrs.addFlashAttribute("errorMessage","Please complate all requried fields") ;
				return "redirect:/admin/announcement";
			}
		}
		catch(Exception e)
		{
			logger.error("Error : ", e);
			redirectAttrs.addFlashAttribute("errorMessage","An unexpected error occured !!!") ;
			return "redirect:/admin/announcement";
		}

		return "redirect:/admin/announcement?id={id}";
	}
	
	
	private Set<Image> saveImages(AnnouncementInfo announcementInfo, Long path) {
		
		Set<Image> images = new HashSet<Image>();
		
		try {		
			if(CollectionUtils.isNotEmpty(announcementInfo.getFiles())){
				for (MultipartFile file : announcementInfo.getFiles()) {
					logger.info("file type {}", file.getContentType());
					if(file.getContentType().contains("application/octet-stream"))
						continue;
					else if(!file.getContentType().contains("image/png") && !file.getContentType().contains("image/jpg") && !file.getContentType().contains("image/jpeg"))
						throw new Exception("image file must be an image/png or image/jpg");
					
					String[] split = file.getOriginalFilename().split("\\.");
					String img = System.currentTimeMillis()+"."+ split[split.length - 1];
					byte[] bytes = file.getBytes();
					File nfile = new File(IMAGE_PATH +"/"+ path+"/"+img);
					nfile.getParentFile().mkdirs();
					logger.info("file path {}", nfile.getAbsolutePath());
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(nfile));
					
					stream.write(bytes);
					stream.close();
					
					Image image = new Image();
					image.setAlt(img);
					image.setPath(path+"/"+img);
					imageDao.create(image);
					images.add(image);					
				}
			}		
		} catch (Exception e) {
			logger.error("error when getting bytes {}", e.getMessage());
		}			
		return images ;
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
