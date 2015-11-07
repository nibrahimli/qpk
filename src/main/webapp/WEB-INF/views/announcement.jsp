<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	
	<c:set var="title" value="${fn:replace(announcementInfo.title,' ', '-')}"/>
	<c:set var="title" value="${fn:toLowerCase(title)}"/>
	
	<title><c:out value="${title}"/></title>
	
	<br/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5">
				<ul class="bxslider">
				  	<c:forEach items="${announcementInfo.images}" var="image" varStatus="status">
						<li><img src="<c:url value="/qrupEmlakImages/${image.path}"/>"/></li>
					</c:forEach>
				</ul>
			</div>	
			
			<div class="col-md-7">
				<h2>${announcementInfo.title}</h2>
					<table class="table table-hover">
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
								<td>Qiymət</td>
								<td id="price">${announcementInfo.price} ${announcementInfo.currency.code}</td>
							</tr>
							<tr>
								<td>Adres</td>
								<td>${address.number}, ${address.street} ${address.district.originalName}, ${address.city.originalName}</td>
							</tr>
							<tr>
								<td>Əlavə məlumat</td>
								<td>${announcementInfo.description}</td>
							</tr>
	
						</tbody>
					</table>
			</div>				
		</div>
	</div>	
	
	
	
	<div class="annOther">

		<div class="list">

			<div class="list-title">
				<div class="title-wrap">
					<h2>Releted Links</h2>
				</div>
			</div>

			<div class="ads">
				<c:if test="${relatedAnnList != null}">
					<c:forEach items="${relatedAnnList}" var="announcement">
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
				</c:if>
			</div>	
		</div>
</div>

<style type="text/css">

.bx-next{
	margin-right: 11px;
}

.bx-wrapper img {
    margin: 0 auto;
}

</style>

<script>
	$('.bxslider').bxSlider();

</script>