$( document ).ready(function() {
	$(".toggle").click( function() {
		$("body").toggleClass("sidebarOpen", 50);
		$(".sidebar").toggleClass("sidebarOpens");
		$("#showLeftPushIcon").toggleClass("fa-close");
	});
});

