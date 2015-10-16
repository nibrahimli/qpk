$( document ).ready(function() {
	$(".toggle").click( function() {
		$(".page").toggleClass("sidebarOpen", 500);
		$(".sidebar").toggleClass("sidebarOpens");
		$("#showLeftPushIcon").toggleClass("fa-close");
	});
});