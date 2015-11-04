package com.qrupemlak.backoffice.data;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import com.nibrahimli.database.image.entity.Image;
import com.nibrahimli.database.qrupEmlak.entity.Address;
import com.nibrahimli.database.qrupEmlak.entity.Announcement;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.Currency;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.HomeType;

public class AnnouncementInfo {
	
	static private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ;

	private Long id;
	private String title;
	private String date;
	private String description;
	private Integer roomNumber;
	private Integer floor;
	private Boolean lift;
	private HomeType homeType;
	private Double surface ;
	private Integer buildingAge;
	private Double price;
	private Currency currency ;
	private Integer viewsNumber;
	private Boolean featuredAnnouncement;
	private Set<Image> images ;
	private AddressInfo addressInfo ;
	private List<MultipartFile> files ;
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the roomNumber
	 */
	public Integer getRoomNumber() {
		return roomNumber;
	}
	/**
	 * @param roomNumber the roomNumber to set
	 */
	public void setRoomNumber(Integer roomNumber) {
		this.roomNumber = roomNumber;
	}
	/**
	 * @return the floor
	 */
	public Integer getFloor() {
		return floor;
	}
	/**
	 * @param floor the floor to set
	 */
	public void setFloor(Integer floor) {
		this.floor = floor;
	}
	/**
	 * @return the lift
	 */
	public Boolean getLift() {
		return lift;
	}
	/**
	 * @param lift the lift to set
	 */
	public void setLift(Boolean lift) {
		this.lift = lift;
	}
	/**
	 * @return the homeType
	 */
	public HomeType getHomeType() {
		return homeType;
	}
	/**
	 * @param homeType the homeType to set
	 */
	public void setHomeType(HomeType homeType) {
		this.homeType = homeType;
	}
	/**
	 * @return the surface
	 */
	public Double getSurface() {
		return surface;
	}
	/**
	 * @param surface the surface to set
	 */
	public void setSurface(Double surface) {
		this.surface = surface;
	}
	/**
	 * @return the buildingAge
	 */
	public Integer getBuildingAge() {
		return buildingAge;
	}
	/**
	 * @param buildingAge the buildingAge to set
	 */
	public void setBuildingAge(Integer buildingAge) {
		this.buildingAge = buildingAge;
	}
	/**
	 * @return the price
	 */
	public Double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(Double price) {
		this.price = price;
	}
	/**
	 * @return the currency
	 */
	public Currency getCurrency() {
		return currency;
	}
	/**
	 * @param currency the currency to set
	 */
	public void setCurrency(Currency currency) {
		this.currency = currency;
	}
	/**
	 * @return the viewsNumber
	 */
	public Integer getViewsNumber() {
		return viewsNumber;
	}
	/**
	 * @param viewsNumber the viewsNumber to set
	 */
	public void setViewsNumber(Integer viewsNumber) {
		this.viewsNumber = viewsNumber;
	}
	/**
	 * @return the featuredAnnouncement
	 */
	public Boolean getFeaturedAnnouncement() {
		return featuredAnnouncement;
	}
	/**
	 * @param featuredAnnouncement the featuredAnnouncement to set
	 */
	public void setFeaturedAnnouncement(Boolean featuredAnnouncement) {
		this.featuredAnnouncement = featuredAnnouncement;
	}
	/**
	 * @return the images
	 */
	public Set<Image> getImages() {
		return images;
	}
	/**
	 * @param images the images to set
	 */
	public void setImages(Set<Image> images) {
		this.images = images;
	}
	/**
	 * @return the addressInfo
	 */
	public AddressInfo getAddressInfo() {
		return addressInfo;
	}
	/**
	 * @param address the addressInfo to set
	 */
	public void setAddressInfo(AddressInfo addressInfo) {
		this.addressInfo = addressInfo;
	}
	/**
	 * @return the files
	 */
	public List<MultipartFile> getFiles() {
		return files;
	}
	/**
	 * @param files the files to set
	 */
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	
	public AnnouncementInfo create(Announcement announcement) {
		this.setId(announcement.getId());
		this.setTitle(announcement.getTitle());
		this.setDate(sdf.format(announcement.getDate()));
		this.setDescription(announcement.getDescription());
		this.setRoomNumber(announcement.getRoomNumber());
		this.setFloor(announcement.getFloor());
		this.setLift(announcement.getLift());
		this.setHomeType(announcement.getHomeType());
		this.setSurface(announcement.getSurface());
		this.setBuildingAge(announcement.getBuildingAge());
		this.setPrice(announcement.getPrice());
		this.setCurrency(announcement.getCurrency());
		this.setFeaturedAnnouncement(announcement.getFeaturedAnnouncement());
		this.setViewsNumber(announcement.getViewsNumber());
		this.setImages(announcement.getImages());
		this.setAddressInfo(createAddressInfo(announcement.getAddress()));
		
		return this;
	}
	private AddressInfo createAddressInfo(Address address) {
		AddressInfo addressInfo = new AddressInfo();
		addressInfo.setId(address.getId());
		addressInfo.setNumber(address.getNumber());
		addressInfo.setStreet(address.getStreet());
		addressInfo.setCountry(address.getCountry().getId());
		addressInfo.setCity(address.getCity().getId());
		addressInfo.setDistrict(address.getDistrict().getId());
		return addressInfo;
	}
	public Announcement update(Announcement announcement, Address address, Set<Image> images) throws Exception {
		if(this.getId() != null)
			announcement.setId(this.getId());
		announcement.setDate(sdf.parse(this.getDate()));		
		announcement.setTitle(this.getTitle());
		announcement.setDescription(this.getDescription());
		announcement.setRoomNumber(this.getRoomNumber());
		announcement.setFloor(this.getFloor());
		announcement.setLift(this.getLift());
		announcement.setHomeType(this.getHomeType());
		announcement.setSurface(this.getSurface());
		announcement.setBuildingAge(this.getBuildingAge());
		announcement.setPrice(this.getPrice());
		announcement.setCurrency(this.getCurrency());
		announcement.setFeaturedAnnouncement(this.getFeaturedAnnouncement());
		announcement.setViewsNumber(this.getViewsNumber());
		announcement.setImages(images);
		announcement.setAddress(address);
		return announcement;
	}
}
