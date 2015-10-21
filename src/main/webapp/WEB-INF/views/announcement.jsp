<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div class="container-fluid">

	<div class="row">
	
		<div class="col-md-8" id="slo">		
			<ul class="bxslider">
			  <li><img src="<c:url value="/resources/img/img1.jpg"/>"/></li>
			  <li><img src="<c:url value="/resources/img/img2.jpg" />"/></li>
			  <li><img src="<c:url value="/resources/img/img3.jpg" />" /></li>
			</ul>													
		</div>
		<div class="col-md-4">
			<h2>${announcementInfo.title}</h2>
			<dl class="dl-horizontal">
			  <dt>Tarix</dt>
			  <dd>${announcementInfo.date}</dd>
			  <dt>Qiymət</dt>
			  <dd>${announcementInfo.price} ${announcement.currency.code}</dd>
			  <dt>Əmlak Tipi</dt>
			  <dd>${announcementInfo.homeType.type}</dd>
			  <dt>Otaq sayısı</dt>
			  <dd>${announcementInfo.roomNumber}</dd>
			  <dt>Adres</dt>
			  <dd>${addressInfo.number}, ${addressInfo.street} ${addressInfo.district.originalName} ${addressInfo.city.originalName}</dd>
			  <dt>Əlavə məlumat</dt>
			  <dd>${announcementInfo.description}</dd>			  
			</dl>									
		</div>
		
	</div>
	<div class="row" id="littleImgs">		
		<div id="bx-pager">
			<div class="col-md-2" >											
		  		<a data-slide-index="0" href="" ><img class="img-responsive img-rounded" src="<c:url value="/resources/img/img1.jpg"/>"/></a>
		  	</div>
		  	<div class="col-md-2" >	
		  		<a data-slide-index="1" href="" ><img class="img-responsive img-rounded" src="<c:url value="/resources/img/img2.jpg" />"/></a>
		  	</div>
		  	<div class="col-md-2" >	
		 		<a data-slide-index="2" href="" ><img class="img-responsive img-rounded" src="<c:url value="/resources/img/img3.jpg" />"/></a>					
			</div>								
		</div>		
	</div>	
		
</div>


<style>

	
	#slo {
		border : 10px solid blue ;
		margin : 10px;		
		max-width: 600px;
    	max-height: 300px;
	}		
	
	/* #littleImgs{
		border : 1px solid blue ;			
		max-width: 100px;
    	max-height: 100px;
	} */

</style>



<script>

$('.bxslider').bxSlider({
  pagerCustom: '#bx-pager',
  oneToOneTouch : true
});

</script>