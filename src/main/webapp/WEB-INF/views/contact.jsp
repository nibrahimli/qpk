<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="sectionContact">
	<h3>Bizimlə əlaqə saxlayın!</h3>
	<form class="form-horizontal" role="form" method="post"
		action="index.php">

		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">Ad</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="Ad & Soyad" value="">
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Email</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="email" name="email"
					placeholder="example@domain.com" value="">
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Mövzu</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="email" name="email"
					placeholder="" value="">
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="nomre col-sm-2 control-label">Telefon	Nömrənsi</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="email" name="email"
					placeholder="" value="">
			</div>
		</div>
		<div class="form-group">
			<label for="message" class="col-sm-2 control-label">Mesaj</label>
			<div class="col-sm-10">
				<textarea class="form-control" rows="4" name="message"></textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-10 col-sm-offset-2">
				<input id="submit" name="submit" type="submit" value="Send"
					class="btn btn-primary">
			</div>
		</div>
	</form>
</div>