<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>
	<div class="navBar">
		<div class="logo">
			<a href="#"><img class="logo" src="<c:url value="/resources/img/logo.png" />"></a>
		</div>
		<p class="toggle">&#9776;</p>
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
							<li><a href="#">Azerbaycanca</a></li>
							<li><a href="#">Turkce</a></li>
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
					<li><a href="/">Ana Sehife</a></li>
					<li><a href="#">Etrafli Axtaris</a></li>
					<li><a href="#">Haqqimizda</a></li>
					<li><a href="<c:url value="/contact"/>">Bizimle Elaqe</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>