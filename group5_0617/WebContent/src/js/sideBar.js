$(window).scroll(function(event) {
	var currentPosition = $("#asideWelcomePageMovieRank").scrollTop();	
	var position = $(window).scrollTop();
	
	$("#asideWelcomePageMovieRank").scrollTop(position);
});

