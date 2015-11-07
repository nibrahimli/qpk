<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="searchAdvanced">
	<div class="searchSection">
		<form:form action="${url}" class="form-horizontal" commandName="searchInfo"
			method="POST">
			<div class="form-group">
				<div class="col-sm-10  col-sm-offset-1" id="city-chosen">							
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10  col-sm-offset-1" id="district-chosen">							
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<form:select class="homeType-chosen-box" path="homeTypes" data-placeholder="Əmlak Tipi Seçin..." style="width:332px;" multiple="true">
					<c:forEach var="homeType" items="${homeTypeList}" varStatus="status">
						<form:option value="${homeType}">${homeType.type}</form:option>
					</c:forEach>
				</form:select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<form:input class="form-control" path="minPrice" placeholder="Minimum qiymət"/>
				</div>
			</div>			
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<form:input class="form-control" path="maxPrice" placeholder="Maksimum qiyməti"/>
				</div>
			</div>			
			<div class="form-group">
				<div class="col-sm-4 col-sm-offset-1">
					<form:select path="currency">
						<c:forEach var="currency" items="${currencyList}" varStatus="status">
							<form:option value="${currency}">${currency.code}</form:option>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<form:input class="form-control" path="minSurface" placeholder="Minimum sahə"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<form:input class="form-control" path="maxSurface" placeholder="Maksimum sahə"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<form:input class="form-control" path="minRoomNumber" placeholder="Minimum otaq sayısı"/>
				</div>
			</div>					
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<form:input class="form-control" path="maxRoomNumber" placeholder="Maksimum otaq sayısı"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<form:input class="form-control" path="minFloor" placeholder="Minimum mərtəbə"/>
				</div>
			</div>					
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<form:input class="form-control" path="maxFloor" placeholder="Maksimum mərtəbə"/>
				</div>
			</div>								
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<button type="submit" class="btn btn-success btn-block">Axtar</button>					
				</div>
			</div>								
		</form:form>
		
	</div>

	<div class="announcements">

	<div class="ads">
		<c:forEach items="${announcementList}" var="announcement">
			<div class="one">
				<div class="image">
					<c:forEach items="${announcement.images}" var="image" end="0">
						<c:set var="title" value="${fn:replace(announcement.title,' ', '-')}"/>
						<c:set var="title" value="${fn:toLowerCase(title)}"/>
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
							<p>${announcement.price} ${announcement.currency.code}</p>
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
	
		
	$(".homeType-chosen-box").chosen();						
}); 
</script>