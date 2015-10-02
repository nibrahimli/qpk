<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="first">
	<div class="slider">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="<c:url value="/resources/img/img1.jpg"/>" alt="img1">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="<c:url value="/resources/img/img2.jpg"/>" alt="img2">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="<c:url value="/resources/img/img2.jpg"/>" alt="img3">
					<div class="carousel-caption">...</div>
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="search">
		<form class="form-inline">
			<div class="form-group">
				<select id="city" name="city" class="form-control">
					<option value="City" selected="selected">City</option>
					<option value="Baki">Baki</option>
					<option value="Naxcivan">Naxcivan</option>
				</select>
			</div>
			<div class="form-group">
				<select id="category" name="category" class="form-control">
					<option value="category" selected="selected">Category</option>
					<option value="Baki">Heyet Evi</option>
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
			<button type="submit" class="btn btn-default">Search</button>
		</form>
	</div>
</div>

<div class="list">
	<div class="list-title">
		<p>Featured List</p>
	</div>
	<div class="ads">
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>

			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
		<div class="one">
			<a href="#"><img src="<c:url value="/resources/img/home.jpg"/>" alt="home"></a>
			<div class="top">
				<div class="bath">
					<p>Bath</p>
					<p>2</p>
				</div>
				<div class="bed">
					<p>Bed</p>
					<p>2</p>
				</div>
				<div class="gar">
					<p>Garage</p>
					<p>4</p>
				</div>
			</div>
			<div class="bottom">
				<p class="price">12220 $</p>
				<a class="detail">View detail</a>
			</div>
		</div>
	</div>
</div>