$(document).ready(main_template);

var ctt = 1;

function main_template () {

	//Variable que caputara la altura del header para usarse como parametro
	var h = $('#header_template').height();

	//Funcion que se activa mientras se altera el tamaño de la ventana
	$(window).resize(function(){
		h = $('#header_template').height();
   		$('#arbol_template').css('margin-top',h+'px');
	});

	//Funcion que despliega el arbol de forma animada
	$('#menu_desplegable_template').click(function(){
		$('#arbol_template').css('margin-top',h+'px');

		if (ctt == 1) {
			$('#arbol_template').animate({
				left: '0'
			});
			ctt = 0;
		} else {
			ctt = 1;
			$('#arbol_template').animate({
				left: '-100%'
			});
		}
	});

	//Funcion que captura el evento Scroll
	$(window).on('scroll',function(){
		if($(window).scrollTop() > 0){
			$('#header_template').css('position','fixed');
		} 
		else{
			$('#header_template').css('position','relative');
		}
	});
 
	// Mostramos y ocultamos submenus
	$('.submenu_template').click(function(){
		$(this).children('.hijo_template').slideToggle();
	});

	//Funcion que mantiene el arbol por debajo del header en todo momento
	$(window).load(function(){
		$('#arbol_template').css('margin-top',h+'px');
	});

	var ha = $('#arbol_template').height() -400;

	$('#arbol_template').mCustomScrollbar({
		setHeight: ha,
		theme:'dark-3'
	});
/*
	var ha = $('#padre').height() -4;

	$('#padre').mCustomScrollbar({
		setHeight: ha,
		theme:'dark-3'
	});*/
}