<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="sidebar">
	<div class="logo">
		<a href="#"><img class="logo" src="<c:url value="/resources/img/logo.png" />"></a>
	</div>
	<nav>
		<ul>
			<li><a href="/">Ana Səhifə</a></li>
			<li><a href="<c:url value="/advancedSearch"/>">Ətraflı Axtarış</a></li>
			<li><a href="<c:url value="/contact"/>">Bizimlə Əlaqə</a></li>
		</ul>
	</nav>

	<div class="social">
		<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
			class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-instagram"></i></a>
	</div>
</div>