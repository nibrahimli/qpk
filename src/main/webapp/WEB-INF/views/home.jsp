<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>Türkiyədən bina evi, ofis, villa, obyekt və torpaq sahəsi elanları - Qrup Emlak</title>
<head>
	<meta name="description" content="Türkiyənin bütün şəhərlərindən bina evi, villa, torpaq sahəsi, ofis və obyekt elanları">
</head>

<div class="scene">
	
	<div class="homeSlider">
		<ul class="bxslider">
			<li><img src="<c:url value="/resources/img/home-bg2.jpg"/>"></li>
			<li><img src="<c:url value="/resources/img/home-bg3.jpg"/>"></li>
			<li><img src="<c:url value="/resources/img/home-bg4.jpg"/>"></li>
		</ul>
	</div>

	<div class="search">
		<c:url var="url" value="/axtaris/" />
		<form:form action="${url}" class="form-horizontal"
		commandName="searchInfo" method="POST">
		<div class="form-group">
			<label>Şəhər</label>
			<div id="city-chosen"></div>
		</div>
		<div class="form-group">
			<label>Əmlak tipi</label>
			<div id="type-chosen">
				<form:select class="homeType-chosen-box" data-placeholder="Əmlak Tipi Seçin..."  path="homeTypes" multiple="true">
					<c:forEach var="homeType" items="${homeTypeList}"
						varStatus="status">
						<form:option value="${homeType}">${homeType.type}</form:option>
					</c:forEach>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<label>Otaq sayı</label>
			<div id="roomnumber-chosen">
				<form:select class="form-control roomNumber-chosen-box"
					path="roomNumber">
					<form:option value="">Hamısı</form:option>
					<form:option value="1">1</form:option>
					<form:option value="2">2</form:option>
					<form:option value="3">3</form:option>
					<form:option value="4">4</form:option>
					<form:option value="5+">5 və üstü</form:option>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<label>Minumum qiymət</label>
			<div id="min-price">
				<form:input class="form-control" placeholder="Min qiymət" path="minPrice"/>
			</div>
		</div>
		<div class="form-group">
			<label>Maximum qiymət</label>
			<div id="max-price">
				<form:input class="form-control" placeholder="Max qiymət" path="maxPrice"/>
			</div>
		</div>
		<div class="form-group">			
			<div id="currency-chosen">
				<form:select path="currency">
					<c:forEach var="currency" items="${currencyList}"
						varStatus="status">
						<c:choose>
							<c:when test="${currency.code eq 'USD'}">
								<form:option value="${currency}" selected="selected">${currency.code}</form:option>							
							</c:when>
							<c:otherwise>
								<form:option value="${currency}">${currency.code}</form:option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<div id="search-button">
				<button type="submit" class="btn btn-success btn-block">Axtar</button>
			</div>
		</div>
	</form:form>
	</div>
</div>

<div class="list">
	<div class="list-title">
		<div class="title-wrap">
			<h2>Önə çıxan elanlar</h2>
		</div>
	</div>

	<div class="ads">
		<c:forEach items="${announcementList}" var="announcement">
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

<script>
	$(document).ready(function(){	
 
 		$(".search").show();
 		$(".homeSlider").show();
		var cities = ${locationInfoGson}.cities;	
		
		var div='<select class="city-chosen-box" data-placeholder="Şəhər Seçin... " multiple name="cities">';		
		
		$.each(cities, function(i, city) {
		  	div+='<option value='+city.id+'>'+city.originalName+'</option>'
		});
		
		div+='</select>';		

		$("#city-chosen").append(div);
 		$(".city-chosen-box").chosen();
 		
		$(".homeType-chosen-box").chosen();
		$("input.default").css("value", " ");
				
		$(".roomNumber-chosen-box").chosen();
		
		$(".chosen-container").css("width", "630px")
		
		//slider options
		$('.bxslider').bxSlider({
			pagerCustom: '#bx-pager',
			auto: true,
			pause: 5000,
			speed: 2000,
			mode: 'fade'
		});			
	}); 									
</script>