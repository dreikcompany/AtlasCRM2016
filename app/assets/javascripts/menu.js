$(document).ready(main);

var contador = 1;

function main () {

	//Variable que caputara la altura del header para usarse como parametro
	var h = $('#header').height();

	//Funcion que se activa mientras se altera el tamaño de la ventana
	$(window).resize(function(){
		h = $('#header').height();
   		$('#arbol').css('margin-top',h+'px');
	});

	//Funcion que despliega el arbol de forma animada
	$('#menu_desplegable').click(function(){
		$('#arbol').css('margin-top',h+'px');

		if (contador == 1) {
			$('#arbol').animate({
				left: '0'
			});
			contador = 0;
		} else {
			contador = 1;
			$('#arbol').animate({
				left: '-100%'
			});
		}
	});

	//Funcion que captura el evento Scroll
	$(window).on('scroll',function(){
		if($(window).scrollTop() > 0){
			$('#header').css('position','fixed');
		}
		else{
			$('#header').css('position','relative');
		}
	});
 
	// Mostramos y ocultamos submenus
	$('.submenu').click(function(){
		$(this).children('.hijo').slideToggle();
	});

	//Funcion que mantiene el arbol por debajo del header en todo momento
	$(window).load(function(){
		$('#arbol').css('margin-top',h+'px');
	});

	var ha = $('#arbol').height() -400;

	$('#arbol').mCustomScrollbar({
		setHeight: ha,
		theme:'dark-3'
	});
	
	$('#scroll_modal_registration').mCustomScrollbar({
		setHeight: 400,
		theme:'dark-3'
	});

	$('.scroll_form').mCustomScrollbar({
		setHeight: 400,
		theme:'dark-3'
	});
/*
	var ha = $('#padre').height() -4;

	$('#padre').mCustomScrollbar({
		setHeight: ha,
		theme:'dark-3'
	});*/


	$('.dropdown-toggle').dropdown();
}