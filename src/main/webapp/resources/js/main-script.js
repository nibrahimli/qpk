$( document ).ready(function() {
	$(".toggle").click( function() {
		$("body").toggleClass("sidebarOpen", 100);
		$(".sidebar").animate({width: 'toggle'}, 1000);
		$("#showLeftPushIcon").toggleClass("fa-close");
	});
	
	$(".searchButtonCircle").click( function() {
		$(".searchSection").slideDown(600);
	});
				
	//Click event to scroll to top
	$('.searchButtonCircle').click(function(){
		var searchSectionHeight = $(".searchSection").height();
		$('html, body').animate({scrollTop : 0},800);
		//return false;	
	});
	
});