$(document).ready(function() {
	$(".topMenuAction-hot").click( function() {
		if ($("#openCloseIdentifier-hot").is(":hidden")) {
			$("#slider-hot").animate({marginTop: "-70px"}, 500 );
			$("#topMenuImage-hot").html('<img src="'+img_dir+'open.png" />');
			$("#openCloseIdentifier-hot").show();
		} else {
			$("#slider-hot").animate({marginTop: "0px"}, 500 );
			$("#topMenuImage-hot").html('<img src="'+img_dir+'close.png" />');
			$("#openCloseIdentifier-hot").hide();
		}
	});  
})