<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="az">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">		
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="google-site-verification" content="IWKOpmt03fSvMTphx31vija8-sWJ6pXEBcAgBKlro1w" />
    	<sitemesh:write property='head'/>    	
    	<title><sitemesh:write property='title'/></title>
    	<!-- <meta name="author" content="nihat ibrahimli && sinan beymemmedli"> -->
	    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/img/favicon.ico" />">	    		   	    
	   
	    <!-- Modernizr CSS -->	       
	    <link rel="stylesheet" href="<c:url value="/resources/css/modernizr.css" />"/>

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
				
		<!-- bx-slider -->
		<link href="<c:url value="/resources/css/jquery.bxslider.css"/>" rel="stylesheet" type="text/css" />	    
	    <script src="<c:url value="/resources/js/jquery.bxslider.min.js"/>" type="text/javascript"></script>	    
	    <!-- Ninja slider -->
	    
	    <!-- google fonts -->
	    <!-- <link href='https://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'> -->
	    		
		<!-- Chosen.js (Bootstrap) autocomplete -->
		<link href="<c:url value="/resources/css/bootstrap-choosen.css"/>" rel="stylesheet" type="text/css"/> 		
		<script src="<c:url value="/resources/js/chosen.jquery.min.js"/>" type="text/javascript"></script>
	    <!-- Chosen.js (Bootstrap) autocomplete -->
	    
	    <!-- Main Theme CSS -->	       
	    <link rel="stylesheet" href="<c:url value="/resources/css/main-style.css" />"/>
	    	    
	   	<script src="https://cdn.jsdelivr.net/whatsapp-sharing/1.3.4/whatsapp-button.js "></script>
	
		<script type="text/javascript" src="<c:url value="/resources/js/main-script.js" />"></script>
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-71822251-1', 'auto');
		  ga('send', 'pageview');
		
		</script>    	
	</head>
	<body>
		<c:import url="/WEB-INF/views/sidemenu.jsp"/>
		<div class="load"><img src="<c:url value="/resources/img/load.gif"/>" /></div>
		<div id="panel">
			<c:import url="/WEB-INF/views/header.jsp"/>
			<div class="content">
				<sitemesh:write property='body'/>
			</div>	
			<c:import url="/WEB-INF/views/footer.jsp"/>
		</div>
		<script type="text/javascript" src="<c:url value="/resources/js/slideout.min.js" />"></script>															
	</body>
</html>