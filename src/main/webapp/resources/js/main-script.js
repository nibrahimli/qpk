$( document ).ready(function() {
	$(".toggle").click( function() {
		$("body").toggleClass("sidebarOpen", 50);
		$(".sidebar").toggleClass("sidebarOpens");
		$("#showLeftPushIcon").toggleClass("fa-close");
	});
	
	$(".searchButtonCircle").click( function() {
		$(".searchSection").slideToggle(600);
	});
				
	//Click event to scroll to top
	$('.searchButtonCircle').click(function(){
		var searchSectionHeight = $(".searchSection").height();
		$('html, body').animate({scrollTop : 0},800);
		//return false;	
	});
	
});