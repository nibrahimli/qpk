<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="sidebar" id="menu">
	<div class="logo">
		<a href="/"><img src="<c:url value="/resources/img/logo.png" />"></a>
	</div>
	<div class="sidebar-wrapper">					
		<nav>
			<ul>
				<li><a href="/">Əsas Səhifə</a></li>
				<li><a href="<c:url value="/axtaris/"/>">Ətraflı Axtarış</a></li>
				<li><a href="<c:url value="/kontakt/"/>">Bizimlə Əlaqə</a></li>
			</ul>
		</nav>				
		<div class="social">		
			<a href="https://plus.google.com/u/0/104769784200604538106/" target="_blank"><i class="fa fa-google-plus"></i></a>
			<a href="https://www.instagram.com/qrupemlak/" target="_blank"><i class="fa fa-instagram"></i></a>					
			<a href="https://www.facebook.com/qrupemlak" target="_blank"><i class="fa fa-facebook"></i></a> 					
		</div>
	</div>
</div>