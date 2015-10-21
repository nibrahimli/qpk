<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<header>
	<div class="navBar">

		<div class="logo">
			<a href="/"><img src="<c:url value="/resources/img/logo.png" />"></a>
		</div>
		<p class="toggle">
			<i id="showLeftPushIcon" class="fa fa-navicon"></i>
		</p>
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
					<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
						class="fa fa-twitter"></i></a> <a href="#"><i
						class="fa fa-instagram"></i></a>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="/">Ana Səhifə</a></li>
					<li><a href="<c:url value="/advancedSearch"/>">Ətraflı Axtarış</a></li>
					<li><a href="<c:url value="/contact"/>">Bizimlə Əlaqə</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<div class="sidebar">
		<div class="logo">
			<a href="/"><img src="<c:url value="/resources/img/logo.png" />"></a>
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
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa fa-instagram"></i></a>
		</div>
	</div>
</header>