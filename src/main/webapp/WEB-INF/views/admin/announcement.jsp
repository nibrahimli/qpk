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
				   <form:hidden path="viewsNumber"/>
				   <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="date">Date</form:label>
				    <div class="col-sm-2">
				      <form:input class="form-control" path="date" placeholder="Date"/>
				    </div>
				    <label class="col-sm-2 control-label" for="roomNumber">Room Number</label>
				    <div class="col-sm-2">				      
				      <form:input class="form-control" path="roomNumber" placeholder="Room Number"/>				      
				    </div>
				    <form:label class="col-sm-2 control-label" path="floor">Floor</form:label>
				    <div class="col-sm-2">
				      <form:input class="form-control" path="floor" placeholder="Floor"/>
				    </div>
				  </div>
				  <div class="form-group">				    
				    <form:label class="col-sm-2 control-label" path="homeType">Home type</form:label>
				    <div class="col-sm-2">
				      <form:select class="form-control" path="homeType" items="${homeTypeList}"/>
				    </div>
				    <form:label class="col-sm-2 control-label" path="surface">Surface</form:label>
				    <div class="col-sm-2">
				      <form:input class="form-control" path="surface" placeholder="Surface"/>
				    </div>
				    <form:label class="col-sm-2 control-label" path="buildingAge">Building Age</form:label>
				    <div class="col-sm-2">
				      <form:input class="form-control" path="buildingAge" placeholder="Building Age"/>
				    </div>
				  </div>
				  <div class="form-group">				  	
				    <form:label class="col-sm-2 control-label" path="price">Price</form:label>
				    <div class="col-sm-2">
				      <form:input class="form-control" path="price" placeholder="Price"/>
				    </div>
				    <form:label class="col-sm-2 control-label" path="currency">Currency</form:label>
				    <div class="col-sm-2">
				      <form:select class="form-control" path="currency" items="${currencyList}"/>
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
				      <select class="form-control" name="addressInfo.country" ng-model="selectedCountry"  ng-options="country.name for country in countries track by country.id"></select>
				    </div>
				    <label class="col-sm-2 control-label" for="city">City</label>
				    <div class="col-sm-2">
				      <select class="form-control" name="addressInfo.city" ng-model="selectedCity"  ng-options="city.name for city in cities track by city.id"></select>
				    </div>
				    <label class="col-sm-2 control-label" for="city">District</label>
				    <div class="col-sm-2">
				      <select class="form-control" name="addressInfo.district" ng-model="selectedDistrict"  ng-options="district.name for district in districts track by district.id"></select>
				    </div>
				  </div>
				  <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="popular">Popular</form:label>
				    <div class="col-sm-2">				      
				      <form:checkbox path="popular"/>
				    </div>
				    <form:label class="col-sm-2 control-label" path="features">Features</form:label>
				    <div class="col-sm-6 col-md-6 col-ld-2">
				      <form:select class="form-control chosen-select" data-placeholder="Choose a feature" multiple="multiple" path="features" tabindex="2">
				      	<form:option value=""></form:option>
				      	<form:options items="${featureList}"/>
				      </form:select>				      
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
				  		<div class="row" id="image-row">
				  			<label class="col-sm-2 control-label">Image</label>
				  			<c:forEach items="${announcementInfo.images}" var="image" varStatus="status">	
				  				  <div class="col-sm-5 col-md-2 saved-image" id="image-${image.id}">								    						    		  
								    <a class="thumbnail show-remove-icon">								    	
								    	<img src="<c:url value="/qrupEmlakImages/${image.path}"/>">
								    </a>								  	
								  	<i class="glyphicon glyphicon-remove remove-icon" data-toggle="tooltip" title="Delete" onclick="return confirm('Are you sure delete image ?') && deleteImage('${image.id}');"></i>
								  </div>								  								  										  					  	
				  			</c:forEach>
				  		</div>					
						<div class="row" id="imageLast">
						  <div class="col-sm-4 col-sm-offset-2">
						    <div class="input-group">
						      <input type="file" class="form-control file" id="file-0" name="files[0]" accept="image/*"/>
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
						  <label class="col-sm-2 control-label" for="files[0]">Image</label>
						  <div class="col-sm-4">
						    <div class="input-group">
						      <input type="file" class="form-control file" id="file-0" name="files[0]" accept="image/*"/>
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

<script type="text/javascript"src="http://cdn.jsdelivr.net/jquery.validation/1.14.0/jquery.validate.min.js" ></script>
<script type="text/javascript"src="http://cdn.jsdelivr.net/jquery.validation/1.14.0/additional-methods.min.js" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/announcement-form-validation.js"/>"></script>

<style>

.saved-image {
    position:relative;
    display:inline-block;
    text-align:center;    
}
.remove-icon {
    position:absolute;
    top:6px;
    right:21px;
    color:white;
    opacity: 0;   
    cursor:pointer; 
}
.show-remove-icon:hover ~ .remove-icon {
	opacity: 1;
} 
.remove-icon:hover {
	opacity: 1;
} 
.glyphicon-remove {
	background-color: #E23C6A;
    border: 3px solid #E23C6A;
}

</style>


<script type="text/javascript">

	$(document).on("change", "input[type='file']", function(){
			var currentValue = this.value.split("\\") ;
			currentValue = currentValue[currentValue.length -1];					
			var currentFile = this ;
			
			$(".file").each(function(){
					if(currentFile != this){
						var value = this.value.split("\\") ;
						value = value[value.length -1];
						if(currentValue === value){
							alert("This image already added");
							currentFile.value = "";
							return false;
						}							
					}							
			});
	 });


	$(function() {
		$("#date").datepicker({
			dateFormat: "yy-mm-dd",
			changeMonth: true,
			numberOfMonths: 1
		});
		
	});
	
	
	function deleteImage(id){			
		$.ajax({
		  method: "POST",
		  url: "delImage",
		  data: {id : id},
		  async: true,		
		  success : function(msg) {
		  
		  	var alertDiv = '<div class="alert alert-success alert-image-remove">';
				alertDiv +=	'<a class="close" data-dismiss="alert" href="#">x</a><b>Image removed with '+msg+'!</b>';
			alertDiv += '</div>';
		  	
			$("#image-row").before(alertDiv);			  					
		
		  	$(".alert-image-remove").fadeTo(1000, 500).slideUp(500, function(){
			    $(".alert-image-remove").alert('close');
			});
			
		  	$("#image-"+id).hide();
		  },
  		  error : function(xhr, ajaxOptions, thrownError) {
  		  	alert(xhr.status);
            alert(thrownError);            		  			  	
		  }
		});
	}
	
	
	
	function addNewDiv(index){ 
		index = parseInt(index) + 1;
		
		var div = '<br/>'		
		    div += '<div class="row" id="lastDiv">';
				div+= '<div class="col-sm-4 col-sm-offset-2">';
					div+= '<div class="input-group">';
					  div+= '<input type="file" class="form-control file" id="file-'+index+'" name="files['+index+']" accept="image/*"/>'
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
			
		$scope.data = ${locationInfoGson} ;
		
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
  	
  	
  	 $(function() {
        $('.chosen-select').chosen();
        $('.chosen-select-deselect').chosen({ allow_single_deselect: true });
      });

</script>