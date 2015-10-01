package com.qrupemlak.backoffice.data;


public class AddressInfo {
	
	private Long id;
	private String street ;
	private String number ;
	private Long district ;
	private Long city ;
	private Long country ;
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
	 * @return the street
	 */
	public String getStreet() {
		return street;
	}
	/**
	 * @param street the street to set
	 */
	public void setStreet(String street) {
		this.street = street;
	}
	/**
	 * @return the number
	 */
	public String getNumber() {
		return number;
	}
	/**
	 * @param number the number to set
	 */
	public void setNumber(String number) {
		this.number = number;
	}
	/**
	 * @return the district
	 */
	public Long getDistrict() {
		return district;
	}
	/**
	 * @param district the district to set
	 */
	public void setDistrict(Long district) {
		this.district = district;
	}
	/**
	 * @return the city
	 */
	public Long getCity() {
		return city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(Long city) {
		this.city = city;
	}
	/**
	 * @return the country
	 */
	public Long getCountry() {
		return country;
	}
	/**
	 * @param country the country to set
	 */
	public void setCountry(Long country) {
		this.country = country;
	}
}
