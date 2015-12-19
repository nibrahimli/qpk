<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<header>
	<div class="navBar">
		<div class="logo">
			<a href="/"><img src="<c:url value="/resources/img/logo.png" />"></a>
		</div>
		<div class="navLine">
			<div class="langBar">

				<div class="lang">
					<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown">
							Language <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">English</a></li>
							<li><a href="#">Azərbaycan</a></li>
							<li><a href="#">Türkiye</a></li>
						</ul>
					</div>
				</div>
				<div class="social">
					<a href="https://plus.google.com/u/0/104769784200604538106/" target="_blank"><i class="fa fa-google-plus"></i></a>
					<a href="https://www.instagram.com/qrupemlak/" target="_blank"><i class="fa fa-instagram"></i></a>					
					<a href="https://www.facebook.com/qrupemlak" target="_blank"><i class="fa fa-facebook"></i></a>
					<span><i class="fa fa-phone"></i> (+994)70 285 27 85</span>			
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="/">Əsas Səhifə</a></li>
					<li><a href="<c:url value="/advancedSearch"/>">Ətraflı Axtarış</a></li>
					<li><a href="<c:url value="/contact"/>">Bizimlə Əlaqə</a></li>
				</ul>
			</nav>
		</div>
		<div class="sidebar-toggle">
			<span></span>
		</div>
	</div>
</header>