package com.qrupemlak.data;

import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.nibrahimli.database.filter.EntityFilter;
import com.nibrahimli.database.filter.Filters;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.Currency;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.HomeType;

public class SearchInfo {
	
	private List<Long> cities ;
	private List<HomeType> homeTypes;
	private Currency currency;
	private Integer maxPrice ;
	private Integer minPrice ;
	private Double maxSurface;
	private Double minSurface;
	private String roomNumber;
	private Integer maxBuildingAge;
	private Integer minBuildingAge;
	private Integer maxFloor;
	private Integer minFloor;
	
	
	
	public List<Long> getCities() {
		return cities;
	}
	public void setCities(List<Long> cities) {
		this.cities = cities;
	}	
	public List<HomeType> getHomeTypes() {
		return homeTypes;
	}
	public void setHomeTypes(List<HomeType> homeTypes) {
		this.homeTypes = homeTypes;
	}
	public Currency getCurrency() {
		return currency;
	}
	public void setCurrency(Currency currency) {
		this.currency = currency;
	}
	public Integer getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Integer minPrice) {
		this.minPrice = minPrice;
	}
	public Integer getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Integer maxPrice) {
		this.maxPrice = maxPrice;
	}
	/**
	 * @return the maxSurface
	 */
	public Double getMaxSurface() {
		return maxSurface;
	}
	/**
	 * @param maxSurface the maxSurface to set
	 */
	public void setMaxSurface(Double maxSurface) {
		this.maxSurface = maxSurface;
	}
	/**
	 * @return the minSurface
	 */
	public Double getMinSurface() {
		return minSurface;
	}
	/**
	 * @param minSurface the minSurface to set
	 */
	public void setMinSurface(Double minSurface) {
		this.minSurface = minSurface;
	}
	/**
	 * @return the roomNumber
	 */
	public String getRoomNumber() {
		return roomNumber;
	}
	/**
	 * @param roomNumber the roomNumber to set
	 */
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}	
	/**
	 * @return the maxBuildingAge
	 */
	public Integer getMaxBuildingAge() {
		return maxBuildingAge;
	}
	/**
	 * @param maxBuildingAge the maxBuildingAge to set
	 */
	public void setMaxBuildingAge(Integer maxBuildingAge) {
		this.maxBuildingAge = maxBuildingAge;
	}
	/**
	 * @return the minBuildingAge
	 */
	public Integer getMinBuildingAge() {
		return minBuildingAge;
	}
	/**
	 * @param minBuildingAge the minBuildingAge to set
	 */
	public void setMinBuildingAge(Integer minBuildingAge) {
		this.minBuildingAge = minBuildingAge;
	}
	/**
	 * @return the maxFloor
	 */
	public Integer getMaxFloor() {
		return maxFloor;
	}
	/**
	 * @param maxFloor the maxFloor to set
	 */
	public void setMaxFloor(Integer maxFloor) {
		this.maxFloor = maxFloor;
	}
	/**
	 * @return the minFloor
	 */
	public Integer getMinFloor() {
		return minFloor;
	}
	/**
	 * @param minFloor the minFloor to set
	 */
	public void setMinFloor(Integer minFloor) {
		this.minFloor = minFloor;
	}
	public EntityFilter build() {
		EntityFilter entityFilter = EntityFilter.builder();
		
		if(CollectionUtils.isNotEmpty(this.cities))
			entityFilter.add(Filters.in("address.city.id", this.cities.toArray()));
		if(CollectionUtils.isNotEmpty(this.homeTypes))
			entityFilter.add(Filters.in("homeType", this.homeTypes.toArray()));
		if(this.currency != null)
			entityFilter.add(Filters.eq("currency", this.currency));
		if(this.maxPrice != null && this.minPrice != null)
			entityFilter.add(Filters.between("price", this.minPrice, this.maxPrice));		
		if(this.maxSurface != null && this.minSurface != null)
			entityFilter.add(Filters.between("surface", this.minSurface, this.maxSurface));
		if(StringUtils.isNotEmpty(this.roomNumber)){
			if(this.roomNumber.equals("5+"))
				entityFilter.add(Filters.between("roomNumber", 5, 100));
			else
				entityFilter.add(Filters.eq("roomNumber", Integer.parseInt(roomNumber)));
		}
		if(this.maxBuildingAge != null && this.minBuildingAge != null)
			entityFilter.add(Filters.between("roomNumber", this.minBuildingAge, this.maxBuildingAge));
		if(this.maxFloor != null && this.minFloor != null)
			entityFilter.add(Filters.between("floor", this.minFloor, this.maxFloor));		
		return entityFilter;
	}
}
