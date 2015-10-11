<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="col-md-2">
	<c:import url="/WEB-INF/views/admin/menu.jsp"/>  
</div>

<div class="col-md-10">
	<fieldset>
	<legend>List of announcement</legend>
		
		<c:import url="/WEB-INF/views/admin/tags/status.jsp" />
		
		<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>Date</th>
					<th>Title</th>
					<th>Address</th>
					<th>Type</th>
					<th>Room Number</th>
					<th>Floor</th>
					<th>Lift</th>
					<th>Price</th>					
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${announcementList}" var="announcement">
					<tr>
					<td class="col-md-1">${announcement.id}</td>
					<td class="col-md-1"><fmt:formatDate value="${announcement.date}" type="both" pattern="yyyy-MM-dd" /></td>
					<td class="col-md-1">${announcement.title}</td>
					<td class="col-md-1">${announcement.address.city.originalName}</td>
					<td class="col-md-1">${announcement.homeType}</td>
					<td class="col-md-1">${announcement.roomNumber}</td>
					<td class="col-md-1">${announcement.floor}</td>
					<td class="col-md-1">${announcement.lift}</td>
					<td class="col-md-1">${announcement.price} ${announcement.currency.code}</td>
					<td class="col-md-1">
						<a class='btn btn-info btn-sm' data-toggle="tooltip" title="Edit" href="<c:url value="/admin/announcement?id=${announcement.id}"/>"><i class="glyphicon glyphicon-edit"></i></a>
						<a class="btn btn-danger btn-sm" data-toggle="tooltip" title="Delete" onclick="return confirm('Are you sure delete announcement ?')" href="<c:url value="/admin/announcement/update?id=${announcement.id}&action=delete"/>"><i class="glyphicon glyphicon-remove"></i> </a>
					</td>					
					</tr>
				</c:forEach>
			</tbody>	
		</table>
		</div>
	</fieldset>
</div>

