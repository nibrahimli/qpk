<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="first">
	<div class="scene">
		<img src="<c:url value="/resources/img/back-logo.jpg"/>">				
	</div>
	<div class="search">	
		<form:form class="form-inline" commandName="announcementInfo" method="POST">
			<div class="f-group">
				<div class="form-group">
					<div id="chosen">						
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-2">
				      <form:select class="form-control" path="homeType">
				      	<c:forEach var="homeType" items="${homeTypeList}">
				      		<form:option value="${homeType}">${homeType.type}</form:option>
				      	</c:forEach>				     					     	 
				      </form:select>
				    </div>
				</div>
			</div>

			<div class="i-group">
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

<script>
	$(document).ready(function(){	
	
		var cities = ${locationInfoGson}.cities;	
		
		var div='<select class="my_select_box" data-placeholder="Choose a country..." style="width:200px;" name="addressInfo.city">';		
		
		$.each(cities, function(i, city) {
		  	div+='<option value='+city.id+'>'+city.originalName+'</option>'
		});
		
		div+='</select>';		
		
		$("#chosen").after(div);
		$(".my_select_box").chosen();
							
	}); 
			
						

</script>