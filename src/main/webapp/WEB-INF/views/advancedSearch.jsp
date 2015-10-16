<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="searchAdvanced">
	<div class="searchSection">
		<form class="form-inline">

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

		</form>
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
								<p class="priceValue">${announcement.price}${announcement.currency.code}</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>