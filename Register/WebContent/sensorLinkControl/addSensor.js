$(document).ready(function(){
	
	
function init(){
	
}

function bindEvents(){
	$(".J-confirm").on("click", function(){
		var value = $(".J-sensorID").val();
		alert(value);
	})
}

function start(){
	init();
	bindEvents();
}
start();

});