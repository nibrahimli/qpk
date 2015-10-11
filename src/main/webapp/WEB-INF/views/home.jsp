<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel">
	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">

		<div class="item active">
			<img class="logo" src="<c:url value="/resources/img/img1.jpg" />">
			<div class="carousel-caption"></div>
		</div>

		<div class="item">
			<img class="logo" src="<c:url value="/resources/img/img2.jpg" />">
			<div class="carousel-caption"></div>
		</div>

		<div class="item">
			<img class="logo" src="<c:url value="/resources/img/img2.jpg" />">
			<div class="carousel-caption"></div>
		</div>
	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-example-generic"
		role="button" data-slide="prev"> <span
		class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#carousel-example-generic"
		role="button" data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>


<div class="list">
	<div class="list-title">
		<p>Featured List</p>
	</div>

	<div class="ads">

		<c:forEach items="${announcementList}" var="announcement">
			<div class="one">

				<c:forEach items="${announcement.images}" var="image" end="0">
					<a href="#"><img
						src="<c:url value="/qrupEmlakImages/${image.path}"/>"></a>
				</c:forEach>

				<div class="top">
					<div class="bath">
						<p>Room</p>
						<p>${announcement.roomNumber}</p>
					</div>
					<div class="bed">
						<p>Home Type</p>
						<p>${announcement.homeType}</p>
					</div>
					<div class="gar">
						<p>Floor</p>
						<p>${announcement.floor}</p>
					</div>
				</div>

				<div class="bottom">
					<p class="price">${announcement.price}
						${announcement.currency.code}</p>
					<a class="detail">View detail</a>
				</div>

			</div>


		</c:forEach>


	</div>
</div>