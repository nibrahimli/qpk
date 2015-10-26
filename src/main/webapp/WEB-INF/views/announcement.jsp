<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="announcement">
	<div class="annTop">
		<div class="annImg">
			<div id="jssor_1"
				style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 800px; height: 456px; overflow: hidden; visibility: hidden; background-color: #24262e;">
				<!-- Loading Screen -->
				<div data-u="loading"
					style="position: absolute; top: 0px; left: 0px;">
					<div
						style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
					<div
						style="position: absolute; display: block; background: url('/resources/img/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
				</div>
				<div data-u="slides"
					style="cursor: default; position: relative; top: 0px; left: 0px; width: 800px; height: 356px; overflow: hidden;">
					
					
					<c:forEach items="${announcementInfo.images}" var="image" varStatus="status">
					
						<div data-p="144.50" style="display: none;">
							<img data-u="image" src="<c:url value="/qrupEmlakImages/${image.path}"/>"/> <img data-u="thumb"
								src="<c:url value="/qrupEmlakImages/${image.path}"/>"/>
						</div>						
					
					</c:forEach>
					
					
										
				</div>
				<!-- Thumbnail Navigator -->
				<div data-u="thumbnavigator" class="jssort01"
					style="position: absolute; left: 0px; bottom: 0px; width: 800px; height: 100px;"
					data-autocenter="1">
					<!-- Thumbnail Item Skin Begin -->
					<div data-u="slides" style="cursor: default;">
						<div data-u="prototype" class="p">
							<div class="w">
								<div data-u="thumbnailtemplate" class="t"></div>
							</div>
							<div class="c"></div>
						</div>
					</div>
					<!-- Thumbnail Item Skin End -->
				</div>
				<!-- Arrow Navigator -->
				<span data-u="arrowleft" class="jssora05l"
					style="top: 158px; left: 8px; width: 40px; height: 40px;"></span> <span
					data-u="arrowright" class="jssora05r"
					style="top: 158px; right: 8px; width: 40px; height: 40px;"></span>				
			</div>
		</div>

		<div class="annDes">
			<div class="container">
				<h2>${announcementInfo.title}</h2>
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>Tarix :</td>
							<td>${announcementInfo.date}</td>
						</tr>
						<tr>
							<td>Əmlak Tipi :</td>
							<td>${announcementInfo.homeType.type}</td>
						</tr>
						<tr>
							<td>Otaq sayısı :</td>
							<td>${announcementInfo.roomNumber}</td>
						</tr>
						<tr>
							<td>Qiymət :</td>
							<td>${announcementInfo.price} ${announcement.currency.code}</td>
						</tr>
						<tr>
							<td>Adres :</td>
							<td>${addressInfo.number}, ${addressInfo.street} ${addressInfo.district.originalName} ${addressInfo.city.originalName}</td>
						</tr>
						<tr>
							<td>Əlavə məlumat :</td>
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