package com.qrupemlak.data;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.collections4.CollectionUtils;

import com.nibrahimli.database.qrupEmlak.entity.QrupEmlakSitemap;

@XmlRootElement(name="urlset")
@XmlAccessorType(XmlAccessType.FIELD)
public class SitemapURLSet {
	
	@XmlElement(name="urls")
	List<SitemapURL> urls ;
	
	public SitemapURLSet() {
		this.urls = new ArrayList<SitemapURL>();
	}

	/**
	 * @return the urls
	 */
	public List<SitemapURL> getUrls() {
		return urls;
	}

	/**
	 * @param urls the urls to set
	 */
	public void setUrls(List<SitemapURL> urls) {
		this.urls = urls;
	}

	public static SitemapURLSet build(List<QrupEmlakSitemap> qeURLs) {
		SitemapURLSet sitemap = new SitemapURLSet() ;
		if(CollectionUtils.isNotEmpty(qeURLs)){
			sitemap.setUrls(SitemapURL.build(qeURLs));
		}
		return sitemap;
	}
	
}
