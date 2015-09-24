<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div class="col-md-2">
	<c:import url="/WEB-INF/views/admin/menu.jsp"/>  
</div>

<div class="col-md-10">
	<fieldset>
			<legend>Edit Announcement</legend>
			<div class="col-md-10">
				
				<c:import url="/WEB-INF/views/admin/tags/status.jsp" />
				
				<c:url var="url" value="/admin/announcement" />
				<form:form action="${url}" class="form-horizontal" commandName="announcementInfo" method="POST">
				   <form:hidden path="id"/>
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
				 <%--  <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="country">Currency</form:label>
				    <div class="col-sm-2">
				      <form:select class="form-control" path="country">
				      	<form:options items="${countryJson}" itemValue="id" itemLabel="originalName" />				      
				      </form:select>
				    </div>
				  </div> --%>
				  <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="title">Title</form:label>
				    <div class="col-sm-10">
				      <form:input class="form-control" path="title" placeholder="Title"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <form:label class="col-sm-2 control-label" path="description">Description</form:label>
				    <div class="col-sm-10">
				      <form:textarea class="form-control" path="description" rows="10"></form:textarea>
				    </div>
				  </div>
				 
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-primary">Save</button>
				      <a href="<c:url value="/blog/articles"/>" class="btn btn-default">Cancel</a>
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
</script>