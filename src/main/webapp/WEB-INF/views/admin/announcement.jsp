<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="col-md-2">
	<c:import url="/WEB-INF/views/admin/menu.jsp"/>  
</div>

<div class="col-md-10" ng-app="announcementApp">
	<fieldset>
			<legend>Edit Announcement</legend>
			<div class="col-md-10">
				
				<c:import url="/WEB-INF/views/admin/tags/status.jsp" />
				
				<c:url var="url" value="/admin/announcement" />
				<form:form action="${url}" class="form-horizontal" commandName="announcementInfo" method="POST" enctype="multipart/form-data">
				   <form:hidden path="id"/>
				   <form:hidden path="addressInfo.id"/>
				   <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="date">Date</form:label>
				    <div class="col-sm-2">
				      <form:input class="form-control" path="date" placeholder="Date"/>
				    </div>
				    <label class="col-sm-2 control-label" for="roomNumber">Room Number</label>
				    <div class="col-sm-2">
				      <input type="number" class="form-control" id="roomNumber" name="roomNumber" value="${announcementInfo.roomNumber}" min="1" max="5" placeholder="Room Number"/>				      
				    </div>
				    <form:label class="col-sm-2 control-label" path="floor">Floor</form:label>
				    <div class="col-sm-2">
				      <form:input class="form-control" path="floor" placeholder="Floor"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="lift">Lift</form:label>
				    <div class="col-sm-2">
				      <form:select class="form-control" path="lift" items="${liftValues}"/>
				    </div>
				    <form:label class="col-sm-2 control-label" path="homeType">Home type</form:label>
				    <div class="col-sm-2">
				      <form:select class="form-control" path="homeType" items="${homeTypeList}"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="price">Price</form:label>
				    <div class="col-sm-2">
				      <form:input class="form-control" path="price" placeholder="Price"/>
				    </div>
				    <form:label class="col-sm-2 control-label" path="currency">Currency</form:label>
				    <div class="col-sm-2">
				      <form:select class="form-control" path="currency" items="${currenyList}"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="addressInfo.number">Street Number</form:label>
				    <div class="col-sm-2">
				      <form:input class="form-control" path="addressInfo.number" placeholder="Number"/>
				    </div>
				    <form:label class="col-sm-2 control-label" path="addressInfo.street">Street</form:label>
				    <div class="col-sm-6">
				      <form:input class="form-control" path="addressInfo.street" placeholder="Street"/>
				    </div>
				  </div>
				  <div class="form-group" ng-controller='formController as formCtrl'>
				    <label class="col-sm-2 control-label" for="country">Country</label>
				    <div class="col-sm-2">
				      <select class="form-control" name="addressInfo.country" ng-model="selectedCountry"  ng-options="country.originalName for country in countries track by country.id"></select>
				    </div>
				    <label class="col-sm-2 control-label" for="city">City</label>
				    <div class="col-sm-2">
				      <select class="form-control" name="addressInfo.city" ng-model="selectedCity"  ng-options="city.originalName for city in cities track by city.id"></select>
				    </div>
				    <label class="col-sm-2 control-label" for="city">District</label>
				    <div class="col-sm-2">
				      <select class="form-control" name="addressInfo.district" ng-model="selectedDistrict"  ng-options="district.originalName for district in districts track by district.id"></select>
				    </div>
				  </div>
				  <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="title">Title</form:label>
				    <div class="col-sm-10">
				      <form:input class="form-control" path="title" placeholder="Title"/>
				    </div>
				  </div>				  
				  <c:choose>
				  	<c:when test="${not empty announcementInfo.images}"> 
				  		<div class="row">
				  			<label class="col-sm-2 control-label" for="files[${status.index}]">Image</label>
				  			<c:forEach items="${announcementInfo.images}" var="image" varStatus="status">	
				  				  <div class="col-sm-4 col-md-2">								    						    		  
								    <a href="#" class="thumbnail">
								    	<img src="<c:url value="https://s3.eu-central-1.amazonaws.com/qrup-emlak-images/${image.path}"/>">
								    </a>
								  </div>								  								  										  					  	
				  			</c:forEach>
				  		</div>					
						<div class="row" id="imageLast">
						  <div class="col-sm-4 col-sm-offset-2">
						    <div class="input-group">
						      <input type="file" class="form-control" id="files[0]" name="files[0]" accept="image/*"/>
						      <span class="input-group-btn" id="addImageInput" onclick="addNewDiv('0')">
						        <button class="btn btn-success"><i class="glyphicon glyphicon-plus"></i></button>
						      </span>
						    </div>
						  </div>						  
						</div>
						<br/>															  					    					  	
				  	</c:when> 				  	
				  	<c:otherwise>
				  		<div class="row" id="imageLast">
						  <div class="col-sm-4 col-sm-offset-2">
						    <div class="input-group">
						      <input type="file" class="form-control" id="files[0]" name="files[0]" accept="image/*"/>
						      <span class="input-group-btn" id="addImageInput" onclick="addNewDiv('0')">
						        <button class="btn btn-success"><i class="glyphicon glyphicon-plus"></i></button>
						      </span>
						    </div>
						  </div>						  
						</div>
						<br/>			  		
				  	</c:otherwise>				  					  					  
				  </c:choose>
				  <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="description">Description</form:label>
				    <div class="col-sm-10">
				      <form:textarea class="form-control" path="description" rows="10"></form:textarea>
				    </div>
				  </div>
				 
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-primary">Save</button>
				      <a href="<c:url value="/admin/announcements"/>" class="btn btn-default">Cancel</a>
				    </div>
				  </div>
				</form:form>				
			</div>	
	</fieldset>			
</div>

<script type="text/javascript">

	$(function() {
		$( "#date" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeMonth: true,
			numberOfMonths: 1
		});
	});
	
	function addNewDiv(index){ 
		index = parseInt(index) + 1;
		
		var div = '<br/>'		
		    div += '<div class="row" id="lastDiv">';
				div+= '<div class="col-sm-4 col-sm-offset-2">';
					div+= '<div class="input-group">';
					  div+= '<input type="file" class="form-control" id="files['+index+']" name="files['+index+']" accept="image/*"/>'
					  div+= '<span class="input-group-btn" id="addInput" onclick="addNewDiv(\''+index+'\')">'
					      div+= '<button class="btn btn-success"><i class="glyphicon glyphicon-plus"></i></button>'
					  div+= '</span>';
					div+= '</div>';
				div+= '</div>';
			div+= '</div>';			
		
				
		$("#imageLast").after(div);			
		$("#imageLast").removeAttr("id");
		$("#lastDiv").attr('id', 'imageLast');
		$("#addImageInput").remove();
		$("#addInput").attr('id', 'addImageInput');					    				  				
	  	
	}

	var iCountry = 0 ;
	var iCity = 0 ;
  	var app = angular.module('announcementApp', []);  	
	app.controller('formController', ['$scope', function($scope){
	
		
		
		$scope.getAllDistrictsOfCity = function(districts, id){
			var arr = []
 		 	 if(id != null){
	 		 	for(var i = 0; i < districts.length; i++) {
	 		 		if(districts[i].city.id == id)
	 		 			arr.push(districts[i]);
	 		 			
	 		 	}
	 		 }
	 		 return arr;
 		 };
 		 
		$scope.getAllCitiesOfCountry = function(cities, id){
			var arr = []
 		 	 if(id != null){
	 		 	for(var i = 0; i < cities.length; i++) {
	 		 		if(cities[i].country.id == id)
	 		 			arr.push(cities[i]);
	 		 			
	 		 	}
	 		 }
	 		 return arr;
 		 };
	
		$scope.getLocation = function(locationList, id){
 		 	 if(id != null){
	 		 	for(var i = 0; i < locationList.length; i++) {
	 		 		if(locationList[i].id == id)
	 		 			return locationList[i] ;
	 		 	}
	 		 }
	 		 return locationList[0];
 		 }; 
 		 	
		$scope.address = '${addressInfoGson}' ;
		if($scope.address != '')
			$scope.address = JSON.parse('${addressInfoGson}') ;				
			
		$scope.data = ${locationsGson} ;
		
		$scope.countries = $scope.data.countries ;
		$scope.selectedCountry = $scope.getLocation($scope.countries, $scope.address.country);
		/*$scope.cities = $scope.getAllCitiesOfCountry($scope.data.cities, $scope.selectedCountry.id) ;					 		  	  					    
		$scope.selectedCity = $scope.getLocation($scope.cities, $scope.address.city);
		$scope.districts = $scope.getAllDistrictsOfCity($scope.data.districts, $scope.selectedCity.id) ; 
		$scope.selectedDistrict = $scope.getLocation($scope.districts, $scope.address.district); */
		
		
		$scope.$watch('selectedCountry', function(newValue) {				
			$scope.cities = $scope.getAllCitiesOfCountry($scope.data.cities, newValue.id) ;
			if(iCountry == 0)
				$scope.selectedCity = $scope.getLocation($scope.cities, $scope.address.city);
			else	
				$scope.selectedCity = $scope.getLocation($scope.cities);
				
			$scope.districts = $scope.getAllDistrictsOfCity($scope.data.districts, $scope.selectedCity.id) ;
			if(iCountry == 0)
				$scope.selectedDistrict = $scope.getLocation($scope.districts, $scope.address.district);
			else
				$scope.selectedDistrict = $scope.getLocation($scope.districts);
			iCountry++;	    			    		
 		});
 		 
 		
		$scope.$watch('selectedCity', function(newValue) {				
			$scope.districts = $scope.getAllDistrictsOfCity($scope.data.districts, newValue.id) ;
			if(iCity == 0)
				$scope.selectedDistrict = $scope.getLocation($scope.districts, $scope.address.district);
			else
				$scope.selectedDistrict = $scope.getLocation($scope.districts);				
			iCity++;	    			    		
 		});
 		
	}]);
  	

</script>