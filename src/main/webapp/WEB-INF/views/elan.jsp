<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<c:choose>
	<c:when test="${not empty announcementInfo.title}">
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/az_AZ/sdk.js#xfbml=1&version=v2.5";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		
		<c:set var="title" value="${fn:replace(announcementInfo.title,' ', '-')}"/>
		<c:set var="title" value="${fn:toLowerCase(title)}"/>
		
		<title>${announcementInfo.title} - Qrup Emlak</title>
		 <head>
			<meta name="description" content="${address.description}">
		</head>
		<div class="container-fluid slider-wrap">
			<div class="row">
				<div class="col-md-5" id="annSlider">
					<div class="slider">
					<ul class="bxslider">
					  	<c:forEach items="${announcementInfo.images}" var="image" varStatus="status">
							<li><img src="<c:url value="/qrupEmlakImages/${image.path}"/>"/></li>
						</c:forEach>
					</ul>
					<span class="expand glyphicon glyphicon-resize-full"></span>
					<div class="social-network">					
						<div class="fb-like" data-href="<c:url value="/elan/${title}---${announcementInfo.id}"/>" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
						<div class="whatsapp-sh"><a href="whatsapp://send" data-text="Bu elana göz at:" data-href="" class="wa_btn wa_btn_s" style="display:none">Paylaş</a></div>					
					</div>
					</div>
				</div>
				<div class="full-slider">
					<ul class="bxslider">
						<c:forEach items="${announcementInfo.images}" var="image"
							varStatus="status">
							<li><img src="<c:url value="/qrupEmlakImages/${image.path}"/>" /></li>
						</c:forEach>
					</ul>
					<span class="collapse glyphicon glyphicon-resize-small"></span>
		
				</div>
			<div class="col-md-7" id="description">
					<div class="panel panel-default">
					  <div class="panel-heading">
					    <h2 class="panel-title">${announcementInfo.title}</h2>
					  </div>
					  <div class="panel-body">
					    <table class="table">
							<tbody>
								<tr>
									<td>Tarix</td>
									<td>${announcementInfo.date}</td>
								</tr>
								<tr>
									<td>Əmlak Tipi</td>
									<td>${announcementInfo.homeType.type}</td>
								</tr>
								<tr>
									<td>Otaq sayısı</td>
									<td>${announcementInfo.roomNumber}</td>
								</tr>
								<tr>
									<td>Sahə</td>
									<td>${announcementInfo.surface}m<sup>2</sup></td>
								</tr>
								<tr>
									<td>Qiymət</td>
									<td id="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${announcementInfo.price}" /> ${announcementInfo.currency.code}</td>
								</tr>
								<tr>
									<td>Adres</td>
									<td>${address.number} ${address.street} ${address.district.originalName} ${address.city.originalName}</td>
								</tr>
								<tr>
									<td>Telefon</td>
									<td>(+994)70 285 27 85</td>
								</tr>
								<tr>
									<td>E-mail</td>
									<td>info@qrupemlak.com</td>
								</tr>
								<tr>
									<td>Əlavə məlumat</td>
									<td>${announcementInfo.description}</td>
								</tr>
								<tr>
									<td></td>
									<td><a href="<c:url value="/kontakt/${title}---${announcementInfo.id}"/>"><button class="hvr-radial-out">Müraciət et</button></a></td>
								</tr>
		
							</tbody>
						</table>
					  </div>
					</div>			
						
						<c:set var="featureListSize" scope="session" value="${fn:length(announcementInfo.features)}"/>
						<c:if test="${featureListSize gt 0}">
						<div class="features panel panel-default">								
											
									<div class="panel-heading">
									    <h3 class="panel-title">Xüsusiyyətlər</h3>
									</div>
								<div class="panel-body">
								<c:set var="endDiv" scope="session" value="1"/>						
								<c:choose>
									<c:when test="${(featureListSize - 1)%3 eq 0 }">
										<c:set var="endDiv" scope="session" value="1"/>
									</c:when>				
									<c:when test="${(featureListSize - 2)%3 eq 0 }">
										<c:set var="endDiv" scope="session" value="2"/>
									</c:when>
									<c:otherwise>
										<c:set var="endDiv" scope="session" value="3"/>					
									</c:otherwise>			
								</c:choose>			
								<c:forEach var="feature" items="${announcementInfo.features}" varStatus="fStatus">
									<c:choose>
										<c:when test="${(fStatus.index + 1)%3 eq 1}">
											<div class="row">
												<div class="col-sm-4 col-md-4">
													<p class="feature"><i class="glyphicon glyphicon-ok"></i> ${feature.type}</p>
												</div>
											<c:if test="${(fStatus.index+1)eq featureListSize and endDiv eq 1}">
												</div>
											</c:if>								
										</c:when>
										<c:when test="${(fStatus.index + 1)%3 eq 2}">
											<div class="col-sm-4 col-md-4">
												<p class="feature"><i class="glyphicon glyphicon-ok"></i> ${feature.type}</p>
											</div>
											<c:if test="${(fStatus.index+1)eq featureListSize and endDiv eq 2}">
												</div>
											</c:if>						
										</c:when>					
										<c:otherwise>
											<div class="col-sm-4 col-md-4">
												<p class="feature"><i class="glyphicon glyphicon-ok"></i> ${feature.type}</p>
											</div>
											<c:if test="${featureListSize gt 3 or endDiv eq 3}">
												</div>
											</c:if>											
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</div>																					
							</div>
						</c:if>	
					</div>
				</div>				
			</div>
		</c:when>
		<c:otherwise>
			<title>Elan tapılmadı - Qrup Emlak</title>
			<head>
				<meta name="description" content="Elanın kodunu düzgün daxil etməmisiniz">
			</head>
			<div class="col-sm-12" style="text-align:center; padding : 0">				
				<div class="alert alert-warning">
					<a class="close" data-dismiss="alert" href="#">x</a><b>Təəssüf ki, daxil etdiyiniz kodlu elan tapılmadı</b>
				</div>
			</div>			
		</c:otherwise>
</c:choose>	
	
	
	
<c:if test="${not empty relatedAnnList}">
	<div class="annOther">

		<div class="list">

			<div class="list-title">				
				<h2>Oxşar elanlar</h2>				
			</div>

			<div class="ads">
					<c:forEach items="${relatedAnnList}" var="announcement">
						<div class="one">
							<div class="image">
								<c:forEach items="${announcement.images}" var="image" end="0">
									<c:set var="title" value="${fn:replace(announcement.title,' ', '-')}"/>
									<c:set var="title" value="${fn:toLowerCase(title)}"/>
									<a
										href="<c:url value="/elan/${title}---${announcement.id}"/>"><img
										src="<c:url value="/qrupEmlakImages/${image.path}"/>"></a>
								</c:forEach>					
								<div class="top">
									<div class="bed">
										<p>Otaq</p>
										<p>${announcement.roomNumber}</p>
									</div>
									<div class="location">
										<p>Şəhər</p>
										<p>${announcement.address.city.originalName}</p>
									</div>
									<div class="type">
										<p>Əmlak tipi</p>
										<p>${announcement.homeType.type}</p>
									</div>
									<div class="price">
										<p>Qiymət</p>
										<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${announcement.price}" /> ${announcement.currency.code}</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
			</div>	
		</div>
	</div>
</c:if>

<style type="text/css">

.slider {
  display: none;
}
.bx-wrapper img {
    margin: 0 auto;
}
.bx-next{
	margin-right: 11px;
}
</style>

<script>
	$(document).ready(function(){	
		$('.slider').show();
		$('.bxslider').bxSlider({
			pagerCustom: '#bx-pager'
		});			
	});	
</script>