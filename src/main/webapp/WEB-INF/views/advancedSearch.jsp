<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="searchAdvanced">
	<div class="searchSection">
		<form:form action="${url}" class="form-horizontal" commandName="searchInfo"
			method="POST">
			<div class="form-group" style="border : 3px solid black">
				<div class="col-sm-4  col-sm-offset-1" id="city-chosen">							
				</div>
			</div>
			<div class="form-group" style="border : 3px solid black">
				<div class="col-sm-4  col-sm-offset-1" id="district-chosen">							
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-4  col-sm-offset-1">
					<form:select class="homeType-chosen-box" path="homeTypes" data-placeholder="Əmlak Tipi Seçin..." style="width:350px;" multiple="true">
					<c:forEach var="homeType" items="${homeTypeList}" varStatus="status">
						<form:option value="${homeType}">${homeType.type}</form:option>
					</c:forEach>
				</form:select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-4 col-sm-offset-1">
					<form:input class="form-control" path="maxPrice" placeholder="Maksimum qiyməti"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-4 col-sm-offset-1">
					<form:input class="form-control" path="minPrice" placeholder="Minimum qiymət"/>
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
		</form:form>
		
		<%-- <form class="form-inline">

			<div class="form-group">
				<select id="city" name="city" class="form-control">
					<option value="City" selected="selected">City</option>
					<option value="Baki">Bakı</option>
					<option value="Naxcivan">Naxçıvan</option>
				</select>
			</div>

			<div class="form-group">
				<select id="category" name="category" class="form-control">
					<option value="category" selected="selected">Category</option>
					<option value="Baki">Həyət Əvi</option>
					<option value="Naxcivan">Villa</option>
				</select>
			</div>

			<div class="form-group">
				<select id="city" name="city" class="form-control">
					<option value="City" selected="selected">City</option>
					<option value="Baki">Bakı</option>
					<option value="Naxcivan">Naxçıvan</option>
				</select>
			</div>

			<div class="form-group">
				<select id="category" name="category" class="form-control">
					<option value="category" selected="selected">Category</option>
					<option value="Baki">Həyət Əvi</option>
					<option value="Naxcivan">Villa</option>
				</select>
			</div>

			<div class="form-group">
				<select id="city" name="city" class="form-control">
					<option value="City" selected="selected">City</option>
					<option value="Baki">Bakı</option>
					<option value="Naxcivan">Naxçıvan</option>
				</select>
			</div>

			<div class="form-group">
				<select id="category" name="category" class="form-control">
					<option value="category" selected="selected">Category</option>
					<option value="Baki">Həyət Əvi</option>
					<option value="Naxcivan">Villa</option>
				</select>
			</div>


			<div class="input-group">
				<div class="input-group-addon">$</div>
				<input type="text" class="form-control" id="minprice"
					placeholder="Min price">
			</div>

			<div class="input-group">
				<div class="input-group-addon">$</div>
				<input type="text" class="form-control" id="maxprice"
					placeholder="Max price">
			</div>

			<div class="searchButton">
				<button type="submit" class="btn btn-default">Search</button>
			</div>

		</form> --%>
	</div>

	<div class="announcements">

	<div class="ads">
		<c:forEach items="${announcementList}" var="announcement">
			<div class="one">
				<div class="image">
					<c:forEach items="${announcement.images}" var="image" end="0">
						<a
							href="<c:url value="/announcement/ERT${announcement.id}ELMXzW"/>"><img
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
	
	var cityDiv='<select class="city-chosen-box" data-placeholder="Şəhər Seçin..." style="width:350px;" multiple name="cities">';		
	
	$.each(cities, function(i, city) {
	  	cityDiv+='<option value='+city.id+'>'+city.originalName+'</option>'
	});
	
	cityDiv+='</select>';		

	$("#city-chosen").append(cityDiv);
	$(".city-chosen-box").chosen();

	var districts = ${locationInfoGson}.districts;	
	
	var districtDiv='<select class="district-chosen-box" data-placeholder="Rayon Seçin..." style="width:350px;" multiple name="districts">';		
	
	$.each(districts, function(i, districts) {
	  	districtDiv+='<option value='+districts.id+'>'+districts.originalName+'</option>'
	});
	
	districtDiv+='</select>';		

	$("#district-chosen").append(districtDiv);
	$(".district-chosen-box").chosen();
	
		
	$(".homeType-chosen-box").chosen();						
}); 
</script>