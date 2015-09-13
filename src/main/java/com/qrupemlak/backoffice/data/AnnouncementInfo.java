package com.qrupemlak.backoffice.data;

import java.text.SimpleDateFormat;
import java.util.Set;

import com.nibrahimli.database.generic.entity.Address;
import com.nibrahimli.database.generic.entity.Image;
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
	private Integer price;
	private Currency currency ;
	private Set<Image> images ;
	private Address address ;
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
	 * @return the price
	 */
	public Integer getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(Integer price) {
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
	 * @return the address
	 */
	public Address getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(Address address) {
		this.address = address;
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
		this.setPrice(announcement.getPrice());
		this.setCurrency(announcement.getCurrency());
		this.setImages(announcement.getImages());
		this.setAddress(announcement.getAddress());
		return this;
	}
}
