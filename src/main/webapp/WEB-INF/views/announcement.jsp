<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="announcement">
	<div class="annTop">
		<div class="annImg">
			<!--start-->
			<div id="ninja-slider">
				<div>
					<div class="slider-inner">
						<ul>
							<c:forEach items="${announcementInfo.images}" var="image" varStatus="status">
								<li><a class="ns-img" href="<c:url value="/qrupEmlakImages/${image.path}"/>"></a></li>
							</c:forEach>						
						</ul>
						<div class="fs-icon" title="Expand/Close"></div>
					</div>
					<div id="thumbnail-slider">
						<div class="inner">
							<ul>
								<c:forEach items="${announcementInfo.images}" var="image" varStatus="status">									
									<li><a class="thumb" href="<c:url value="/qrupEmlakImages/${image.path}"/>"></a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--end-->
		</div>
		<div class="annDes">
			<div class="container">
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
							<td>${addressInfo.number}, ${addressInfo.street} ${addressInfo.district.originalName}, ${addressInfo.city.originalName}</td>
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

</div>