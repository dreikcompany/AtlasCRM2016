$(function(){
	$('#Terminos').click(function() {
		modal({
			type: 'info',
			title: 'Bienvenido a AtlasCRM',
			text: 'Recuerda revisar las promociones en nuestras membresias',
			autoclose: false,
		});
	});

 	$('#success').click(function() {
		modal({
			type: 'success',
			title: 'Success',
			text: 'A simple success message!',
		});
	});
	//warning
	$('#warning').click(function() {
		modal({
			type: 'warning',
			title: 'Warning',
			text: 'A simple warning message!',
			center: false,
		});
	});
	//info
	$('#info').click(function() {
		modal({
			type: 'info',
			title: 'Info',
			text: 'A simple info message!',
			autoclose: true,
		});
	});
	//error
	$('#error').click(function() {
		modal({
			type: 'error',
			title: 'Error',
			text: 'A simple error message!',
		});
	});

	$('#msg_usuario_erroneo').change(function(){
		modal({
			type: 'error',
			title: 'Error',
			text: 'El Usuario/Contraseña son incorrectos',
		});
	});
});