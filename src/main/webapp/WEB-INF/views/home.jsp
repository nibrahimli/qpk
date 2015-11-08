<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="first">
	<div class="scene">
		<img src="<c:url value="/resources/img/back-logo.jpg"/>">				
	</div>
	<div class="search">
	
		<c:url var="url" value="/search" />
		<form:form  action="${url}" class="form-inline" commandName="searchInfo"
			method="POST">
			<div class="form-group" id="city-chosen">				
			</div>
			<div class="form-group">
				<form:select class="form-control homeType-chosen-box" path="homeTypes" data-placeholder="Əmlak Tipi Seçin..." style="width:350px;" multiple="true">
					<c:forEach var="homeType" items="${homeTypeList}" varStatus="status">
						<form:option value="${homeType}">${homeType.type}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group">
				<form:select class="form-control roomNumber-chosen-box" path="roomNumber" data-placeholder="Otaq sayısı..." style="width:350px;">
					<form:option value=""></form:option>
					<form:option value="">hamısı</form:option>
					<option value="1">1</option>
					<form:option value="2">2</form:option>
					<form:option value="3">3</form:option>
					<form:option value="4">4</form:option>
					<form:option value="5+">5 və üstü</form:option>
				</form:select>
			</div>
			<div class="form-group">
				<form:input class="form-control" path="maxPrice" placeholder="Maksimum qiyməti"/>
			</div>
			<div class="form-group">
				<form:input class="form-control" path="minPrice" placeholder="Minimum qiymət"/>
			</div>
			<div class="form-group">
				<form:select path="currency">
					<c:forEach var="currency" items="${currencyList}" varStatus="status">
						<form:option value="${currency}">${currency.code}</form:option>
					</c:forEach>
				</form:select>
			</div>

			<div class="searchButton">
				<button type="submit" class="btn btn-default">Axtar</button>
			</div>			
		 </form:form>
		</div>
</div>

<div class="list">
	<div class="list-title">
		<div class="title-wrap">
			<p>Featured List</p>
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
 
		var cities = ${locationInfoGson}.cities;	
		
		var div='<select class="city-chosen-box" data-placeholder="Şəhər Seçin..." style="width:350px;" multiple name="cities">';		
		
		$.each(cities, function(i, city) {
		  	div+='<option value='+city.id+'>'+city.originalName+'</option>'
		});
		
		div+='</select>';		

		$("#city-chosen").append(div);
 		$(".city-chosen-box").chosen();
 		
		$(".homeType-chosen-box").chosen();
				
		$(".roomNumber-chosen-box").chosen();
		 				
	}); 
			
						

</script>