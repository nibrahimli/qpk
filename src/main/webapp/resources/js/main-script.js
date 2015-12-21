$( document ).ready(function() {
	//Sidebar opening handler
	$('.sidebar-toggle').click(function() {
        slideout.toggle();
    });
	
	var slideout = new Slideout({
	    'panel': document.getElementById('panel'),
	    'menu': document.getElementById('menu'),
	    'padding': 200,
	    'tolerance': 50
	  });
	
	//Search Button Circle fixed button
	var content = $(".content");
	var searchSection = content.find(".searchSection")
	var searchButtonCircle = content.find(".searchButtonCircle");
	$(searchButtonCircle).click( function() {
		$(searchSection).slideDown(600);
	});
				
	//Click event of search Button Circle to scroll to top 
	$('.searchButtonCircle').click(function(){
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