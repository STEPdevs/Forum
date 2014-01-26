$('#boy_label').click(function(){
	$('#user_boy_true').prop('checked',true);
	$('#user_boy_false').prop('checked',false);
	$('#boy_label').css('background-color','blueviolet');
	$('#girl_label').css('background-color','indigo');
});
$('#girl_label').click(function(){
	$('#user_boy_true').prop('checked',false);
	$('#user_boy_false').prop('checked',true);

	$('#user_boy_true').prop('checked',false)	
	$('#girl_label').css('background-color','blueviolet');
	$('#boy_label').css('background-color','indigo');
});

$('#datepicker').datepicker();