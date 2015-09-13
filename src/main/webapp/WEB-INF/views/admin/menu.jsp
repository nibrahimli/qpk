<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Announcement</div>
	<div class="list-group">
	  <a class="list-group-item" href="<c:url value="/admin/announcements" />">Announcements</a>
	  <a class="list-group-item" href="<c:url value="/admin/announcement" />">New announcement</a>
  </div>
</div>

<style type="text/css">
div.panel {
	margin-top: 35px;	
}
</style>