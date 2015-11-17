<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="searchSection">
	<form:form action="${url}" class="form-horizontal"
		commandName="searchInfo" method="POST">
		<div class="form-group">
			<label>Şəhər</label>
			<div id="city-chosen"></div>
		</div>
		<div class="form-group">
			<label>Rayon</label>
			<div id="district-chosen"></div>
		</div>
		<div class="form-group">
			<label>Əmlak tipi</label>
			<div id="type-chosen">
				<form:select class="homeType-chosen-box" path="homeTypes"
					data-placeholder="Əmlak Tipi Seçin..."
					multiple="true">
					<c:forEach var="homeType" items="${homeTypeList}"
						varStatus="status">
						<form:option value="${homeType}">${homeType.type}</form:option>
					</c:forEach>
				</form:select>
			</div>
		</div>
		<div class="form-group">
			<label>Minumum qiymət</label>
			<div id="min-price">
				<form:input class="form-control" path="minPrice"
					placeholder="Min qiymət" />
			</div>
		</div>
		<div class="form-group">
			<label>Maksimum qiymət</label>
			<div id="max-price">
				<form:input class="form-control" path="maxPrice"
					placeholder="Max qiymət" />
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
			<label>Otaq sayı</label>
			<div id="roomnumber-chosen">
				<form:select class="form-control roomNumber-chosen-box"
					path="roomNumber" data-placeholder="Otaq sayısı...">					
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
			<label>Minimum sahə m<sup>2</sup></label>
			<div id="min-area">
				<form:input class="form-control" path="minSurface"
					placeholder="Min sahə" />
			</div>
		</div>
		<div class="form-group">
			<label>Maksimum sahə m<sup>2</sup></label>
			<div id="max-area">
				<form:input class="form-control" path="maxSurface"
					placeholder="Max sahə" />
			</div>
		</div>
		<div class="form-group">
			<label>Minimum mərtəbə</label>
			<div id="min-floor">
				<form:input class="form-control" path="minFloor"
					placeholder="Min mərtəbə" />
			</div>
		</div>
		<div class="form-group">
			<label>Maksimum mərtəbə</label>
			<div id="max-floor">
				<form:input class="form-control" path="maxFloor"
					placeholder="Max mərtəbə" />
			</div>
		</div>
		<div class="form-group">
			<div id="search-button">
				<button type="submit" class="btn btn-success btn-block">Axtar</button>
			</div>
		</div>
	</form:form>

</div>

<div class="searchButtonCircle"><span class="glyphicon glyphicon-search"></span></div>

<div class="searchResult">

	<div class="list">
		<div class="ads">
			<c:forEach items="${announcementList}" var="announcement">
				<div class="one">
					<div class="image">
						<c:forEach items="${announcement.images}" var="image" end="0">
							<c:set var="title"
								value="${fn:replace(announcement.title,' ', '-')}" />
							<c:set var="title" value="${fn:toLowerCase(title)}" />
							<a
								href="<c:url value="/announcement/${title}----${announcement.id}"/>"><img
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
								<p>
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${announcement.price}" />
									${announcement.currency.code}
								</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>

$(document).ready(function(){	
	 
	$(".searchSection").show(); 
	var cities = ${locationInfoGson}.cities;	
		
	var cityDiv='<select class="city-chosen-box" data-placeholder="Şəhər Seçin..." style="width:332px;" multiple name="cities">';
	
	var array = eval('${searchInfo.cities}');
	
	$.each(cities, function(i, city) {
		if(array != null && $.inArray(city.id, array) > -1)
			cityDiv+='<option value='+city.id+' selected="selected">'+city.originalName+'</option>'
		
		else	
	  		cityDiv+='<option value='+city.id+'>'+city.originalName+'</option>'
	});
	
	cityDiv+='</select>';		

	$("#city-chosen").append(cityDiv);
	$(".city-chosen-box").chosen();

	var districts = ${locationInfoGson}.districts;	
	
	var districtDiv='<select class="district-chosen-box" data-placeholder="Rayon Seçin..." style="width:332px;" multiple name="districts">';		
	
	$.each(districts, function(i, districts) {
	  	districtDiv+='<option value='+districts.id+'>'+districts.originalName+'</option>'
	});
	
	districtDiv+='</select>';		

	$("#district-chosen").append(districtDiv);
	$(".district-chosen-box").chosen();
	
		
	$(".roomNumber-chosen-box").chosen();
	$(".homeType-chosen-box").chosen();	
	
	
	//search box hidden when user searches
	var searchIcon = eval('${searchIcon}');
	
	if(searchIcon == true && window.innerWidth <= 750) {
		$(".searchSection").css({"display" : "none"});
	}
	else{
		$(".searchSection").show();
	}								
}); 
</script>