$( document ).ready(function() {
	//Sidebar opening handler
	var content = $(".content");
	var header = $("header");
	var toggle = header.find(".toggle");
	var sidebar = header.find(".sidebar");
	$(toggle).click( function() {
		$(sidebar).animate({width: 'toggle'}, 200);
	});
	$(content).click(function() {
		$(sidebar).hide("slide",{ direction: "right" }, 200);
	});
	
	//Search Button Circle fixed button
	var searchSection = content.find(".searchSection")
	var searchButtonCircle = content.find(".searchButtonCircle");
	$(searchButtonCircle).click( function() {
		$(searchSection).slideDown(600);
	});
				
	//Click event of search Button Circle to scroll to top 
	$('.searchButtonCircle').click(function(){
		var searchSectionHeight = $(".searchSection").height();
		$('html, body').animate({scrollTop : 0},800);
		return false;	
	});
	
	//Full slider
	var expand = content.find(".expand");
	var fullSlider = content.find(".full-slider");
	var li = fullSlider.find("li");
	var image = li.find("img");
	$(fullSlider).width(window.outerWidth);
	$(expand).click(function(){
		$(fullSlider).css("visibility", "visible");
		$(image).css("visibility", "visible");
		$("body").css("overflow-y", "hidden");
		$('html, body').animate({scrollTop : 0},100);
	});

	$(".collapse").click(function(){
		$(image).css("visibility", "hidden");
		$(fullSlider).css("visibility", "hidden");
		$("body").css("overflow-y", "auto")
	});
});