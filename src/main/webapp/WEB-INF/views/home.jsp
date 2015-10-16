<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="first">
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">

			<div class="item active">
				<img class="logo" src="<c:url value="/resources/img/img1.jpg" />">
			</div>

			<div class="item">
				<img class="logo" src="<c:url value="/resources/img/img2.jpg" />">
			</div>

			<div class="item">
				<img class="logo" src="<c:url value="/resources/img/img2.jpg" />">
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<div class="search">
		<form class="form-inline">
			<div class="f-group">
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
						<option value="Baki">Həyıt Evi</option>
						<option value="Naxcivan">Villa</option>
					</select>
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
				<button type="submit" class="btn btn-default">Search</button>
			</div>

		</form>
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
						<div class="bath">
							<p>Room</p>
							<p>${announcement.roomNumber}</p>
						</div>
						<div class="bed">
							<p>Floor</p>
							<p>${announcement.floor}</p>
						</div>
						<div class="gar">
							<p>Type</p>
							<p>${announcement.homeType}</p>
						</div>
						<div class="price">
							<p>Price</p>
							<p class="priceValue">${announcement.price} ${announcement.currency.code}</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

</div>