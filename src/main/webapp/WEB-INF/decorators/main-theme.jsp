<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="az">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">		
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="qrup emlak turkiyeden ev elanlari">
    	<meta name="author" content="nihat ibrahimli && sinan beymemmedli">
	    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/img/favicon.ico" />">	    		   

		<!-- Main Theme CSS -->	       
	    <link rel="stylesheet" href="<c:url value="/resources/css/main-style.css" />"/>	    
	    
		<!-- jQuery library JS -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>	
		
		<!-- jQuery UI library CSS -->
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">	
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
		
		 <!-- Bootstrap minified CSS -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<!-- Bootstrap JavaScript -->
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
	
		<!-- Social Networks icons -->
		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
				
		<!-- Ninja slider -->
		<link href="<c:url value="/resources/css/thumbnail-slider.css"/>" rel="stylesheet" type="text/css" />
	    <link href="<c:url value="/resources/css/ninja-slider.css"/>" rel="stylesheet" type="text/css" />
	    <script src="<c:url value="/resources/js/thumbnail-slider.js"/>" type="text/javascript"></script>
	    <script src="<c:url value="/resources/js/ninja-slider.js"/>" type="text/javascript"></script>
	    <!-- Ninja slider -->
	    
	    		
		<!-- Typeahead.js autocomplete -->
		<link href="<c:url value="/resources/css/typeahead.css"/>" rel="stylesheet" type="text/css" />
		<script src="<c:url value="/resources/js/bloodhound.min.js"/>" type="text/javascript"></script>
		<script src="<c:url value="/resources/js/typeahead.bundle.min.js"/>" type="text/javascript"></script>
		<script src="<c:url value="/resources/js/typeahead.jquery.min.js"/>" type="text/javascript"></script>	    
	    <!-- Typeahead.js autocomplete -->
		
		
		<script type="text/javascript" src="<c:url value="/resources/js/main-script.js" />"></script>
	    
	    
	   	<sitemesh:write property='head'/>
	    	
	</head>
	<body>
		
		<div class="page">			
			<c:import url="/WEB-INF/views/navbar.jsp"/>
			<div class="content">
				<sitemesh:write property='body'/>
			</div>	
			<c:import url="/WEB-INF/views/footer.jsp"/>								
		</div>		
		
	</body>
</html>