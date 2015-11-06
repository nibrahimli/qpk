package com.qrupemlak.backoffice.data;

import java.util.List;

import org.apache.commons.collections4.CollectionUtils;

import com.nibrahimli.database.filter.EntityFilter;
import com.nibrahimli.database.filter.Filters;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.Currency;
import com.nibrahimli.database.qrupEmlak.entity.Announcement.HomeType;

public class SearchInfo {
	
	private List<Long> cities ;
	private List<HomeType> homeTypes;
	private Currency currency;
	private Double maxPrice ;
	private Double minPrice ;
	
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
	public Double getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Double minPrice) {
		this.minPrice = minPrice;
	}
	public Double getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Double maxPrice) {
		this.maxPrice = maxPrice;
	}
	
	
	public EntityFilter build() {
		EntityFilter entityFilter = EntityFilter.builder();
		
		if(CollectionUtils.isNotEmpty(this.cities))
			entityFilter.add(Filters.in("address.city.id", this.cities.toArray()));
		if(CollectionUtils.isNotEmpty(this.homeTypes))
			entityFilter.add(Filters.in("homeType", this.homeTypes.toArray()));
		if(this.maxPrice != null && this.minPrice != null)
			entityFilter.add(Filters.between("price", this.minPrice, this.maxPrice));
		if(this.currency != null)
			entityFilter.add(Filters.eq("currency", this.currency));
		
		return entityFilter;
	}
}
