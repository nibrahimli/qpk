package com.qrupemlak.backoffice.data;

import java.util.List;

import com.nibrahimli.database.qrupEmlak.entity.City;
import com.nibrahimli.database.qrupEmlak.entity.Country;
import com.nibrahimli.database.qrupEmlak.entity.District;

public class LocationInfo {
	
	List<Country> countries ;
	List<City> cities ;
	List<District> districts ;
	/**
	 * @return the countries
	 */
	public List<Country> getCountries() {
		return countries;
	}
	/**
	 * @param countries the countries to set
	 */
	public void setCountries(List<Country> countries) {
		this.countries = countries;
	}
	/**
	 * @return the cities
	 */
	public List<City> getCities() {
		return cities;
	}
	/**
	 * @param cities the cities to set
	 */
	public void setCities(List<City> cities) {
		this.cities = cities;
	}
	/**
	 * @return the districts
	 */
	public List<District> getDistricts() {
		return districts;
	}
	/**
	 * @param districts the districts to set
	 */
	public void setDistricts(List<District> districts) {
		this.districts = districts;
	}
}
