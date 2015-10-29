<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="first">
	<div class="scene">
		<img src="<c:url value="/resources/img/back-logo.jpg"/>">				
	</div>
	<div class="search">	
		<form class="form-inline">
			<div class="f-group">
				<div class="form-group">
					<div id="the-basics">
						<input class="typeahead form-control" type="text" placeholder="Şəhər">
					</div>
				</div>

				<div class="form-group">
					<select id="category" name="category" class="form-control">
						<option value="category" selected="selected">Əmlak Tipi</option>
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
				<button type="submit" class="btn btn-default">Axtar</button>
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
	
	var cities = ${locationsGson}.cities;
	var citiesName = [];
	
	$.each(cities, function(i, city) {
	  citiesName.push(city.originalName);
	});

	var substringMatcher = function(strs) {
	  return function findMatches(q, cb) {
	    var matches, substringRegex;
	
	    // an array that will be populated with substring matches
	    matches = [];
	
	    // regex used to determine if a string contains the substring `q`
	    substrRegex = new RegExp(q, 'i');
	
	    // iterate through the pool of strings and for any string that
	    // contains the substring `q`, add it to the `matches` array
	    $.each(strs, function(i, str) {
	      if (substrRegex.test(str)) {
	        matches.push(str);
	      }
	    });
	
	    cb(matches);
	  };
	};
	
	var states = citiesName;
	
	$('#the-basics .typeahead').typeahead({
	  hint: true,
	  highlight: true,
	  minLength: 1
	},
	{
	  name: 'states',
	  source: substringMatcher(states),
	  limit: 4  
	});

			

</script>