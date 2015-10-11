<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container-fluid" id="announcementDiv">

	<div class="row">
	
		<div class="col-md-6">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<c:if test="${not empty announcementInfo.images}">
					<c:set var="size" scope="session" value="${fn:length(announcementInfo.images)}"/>
					
					<!-- Indicators -->
			  		<ol class="carousel-indicators">
						<c:forEach var="i" begin="0" end="${size - 1}">
							<c:choose>
								<c:when test="${i eq  0}">
									<li data-target="#carousel-example-generic" data-slide-to="${i}" class="active"></li>
								</c:when>
								<c:otherwise>
									 <li data-target="#carousel-example-generic" data-slide-to="${i}"></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ol>
					
					 <!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<c:forEach items="${announcementInfo.images}" var="image" varStatus="status">
							<c:choose>
								<c:when test="${status.index eq 0}">
									<div class="item active">
								      <img src="<c:url value="/qrupEmlakImages/${image.path}"/>" alt="${image.alt}">					      					      
								    </div>
							    </c:when>				    
							    <c:otherwise>
								    <div class="item">
								      <img src="<c:url value="/qrupEmlakImages/${image.path}"/>" alt="${image.alt}">					      
								    </div>	
							    </c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</c:if>    
			
			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>	
		
		<div class="col-md-6">
			<h2>${announcementInfo.title}</h2>
			<p>Tarix : ${announcementInfo.date}</p>
			<p>Qiymet : ${announcementInfo.price} ${announcement.currency.code}</p>
			<p>Evin novu : ${announcementInfo.homeType}</p>
			<p>Otaq sayisi : ${announcementInfo.roomNumber}</p>
			<p>Address : ${addressInfo.number}, ${addressInfo.street} ${addressInfo.district.originalName} ${addressInfo.city.originalName}</p>
			<p>${announcementInfo.description}</p>
		</div>
		
	</div>	
</div>


<style>

	#announcementDiv{
		background-color: white;
	}

	img {
	
		max-width : 500px;
		max-height : 500px;
	}
	
	#carousel-example-generic{
		max-width : 700px;
		max-height : 700px;
	}

</style>



<script>

$('.carousel').carousel({
  interval: 2000
});

</script>