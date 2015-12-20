package com.qrupemlak.backoffice.data;


public class RecaptchaImpl implements Captcha{
	String secretKey;
	String siteKey;
	/**
	 * @return the secretKey
	 */
	public String getSecretKey() {
		return secretKey;
	}
	/**
	 * @param secretKey the secretKey to set
	 */
	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}
	/**
	 * @return the siteKey
	 */
	public String getSiteKey() {
		return siteKey;
	}
	/**
	 * @param siteKey the siteKey to set
	 */
	public void setSiteKey(String siteKey) {
		this.siteKey = siteKey;
	}
	
}
