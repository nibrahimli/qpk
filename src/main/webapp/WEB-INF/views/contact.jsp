<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="col-sm-12" style="padding : 0; text-align: center">
	<c:import url="/WEB-INF/views/status.jsp" />
</div>

<div class="sectionContact">
	<div class="sectionContactForm panel panel-default">
		<div class="panel-heading">
		    <h2 class="panel-title">Bizimlə əlaqə saxlayın!</h2>
		</div>
		<div class="panel-body">
			<c:url var="url" value="/contact" />
			<form:form action="${url}" class="form-horizontal" commandName="contactInfo" method="post">
		
				<div class="form-group">
					<form:label path="name" class="col-sm-2 control-label">Ad</form:label>
					<div class="col-sm-10">
						<form:input class="form-control" path="name" placeholder="Ad & Soyad"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="email" class="col-sm-2 control-label">Email</form:label>
					<div class="col-sm-10">
						<form:input path="email" class="form-control"
							placeholder="ad@domain.com"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="subject" class="col-sm-2 control-label">Mövzu</form:label>
					<div class="col-sm-10">
						<form:input path="subject" class="form-control" placeholder="Mövzu" readonly='${readonly}'/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="telephon" class="nomre col-sm-2 control-label">Telefon</form:label>
					<div class="col-sm-10">
						<form:input path="telephon" class="form-control" placeholder="Telefon" />
					</div>
				</div>
				<div class="form-group">
					<form:label path="message" class="col-sm-2 control-label">Mesaj</form:label>
					<div class="col-sm-10">
						<form:textarea class="form-control" rows="4" path="message"></form:textarea>
					</div>
				</div>
		
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-2">
					<button type="submit" class="btn btn-success">Göndər</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<div class="number-email panel panel-default">
		<div class="panel-heading">
		    <h2 class="panel-title">Əlaqə vasitələri</h2>
		</div>
		<div class="panel-body">
			<div class="number">
				<i class="glyphicon glyphicon-earphone"></i><span> (+994)70 285 27 85</span>
			</div>
			<div class="email">
				<i class="glyphicon glyphicon-envelope"></i><span> info@qrupemlak.com</span>
			</div>
		</div>
	</div>
</div>