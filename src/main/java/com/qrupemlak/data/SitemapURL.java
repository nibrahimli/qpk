package com.qrupemlak.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.collections4.CollectionUtils;

import com.nibrahimli.database.qrupEmlak.entity.QrupEmlakSitemap;
import com.nibrahimli.database.qrupEmlak.entity.QrupEmlakSitemap.ChangeFreq;

@XmlRootElement(name="url")
@XmlAccessorType(XmlAccessType.FIELD)
public class SitemapURL {
	
	@XmlElement
	String loc;
	@XmlElement
	Date lastmod;
	@XmlElement
	ChangeFreq changefreq;
	@XmlElement
	float priority;
	
	/**
	 * @return the loc
	 */
	public String getLoc() {
		return loc;
	}
	/**
	 * @param loc the loc to set
	 */
	public void setLoc(String loc) {
		this.loc = loc;
	}
	/**
	 * @return the lastmod
	 */
	public Date getLastmod() {
		return lastmod;
	}
	/**
	 * @param lastmod the lastmod to set
	 */
	public void setLastmod(Date lastmod) {
		this.lastmod = lastmod;
	}
	/**
	 * @return the changefreq
	 */
	public ChangeFreq getChangefreq() {
		return changefreq;
	}
	/**
	 * @param changefreq the changefreq to set
	 */
	public void setChangefreq(ChangeFreq changefreq) {
		this.changefreq = changefreq;
	}
	/**
	 * @return the priority
	 */
	public float getPriority() {
		return priority;
	}
	/**
	 * @param priority the priority to set
	 */
	public void setPriority(float priority) {
		this.priority = priority;
	}
	public static List<SitemapURL> build(List<QrupEmlakSitemap> qeURLs) {
		List<SitemapURL> urls = new ArrayList<SitemapURL>();
		if(CollectionUtils.isNotEmpty(qeURLs)){
			for (QrupEmlakSitemap sitemap : qeURLs) {
				SitemapURL sitemapURL = new SitemapURL();
				sitemapURL.setLoc(sitemap.getLoc());
				sitemapURL.setLastmod(sitemap.getLastMod());
				sitemapURL.setChangefreq(sitemap.getChangeFreq());
				sitemapURL.setPriority(sitemap.getPriority());
				urls.add(sitemapURL);
			}
		}
		return urls;
	}
}
