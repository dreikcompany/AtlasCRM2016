jQuery(document).ready(function($) {

	$(document).load($(window).bind("resize", checkPosition));

	function checkPosition(){
		if($(window).width() >= 944){
			$('#logo_template').css({'background-size':' 170px 50px',
	    	'background-repeat':' no-repeat','width':'170px','height':'56px','margin-top':'6px','float':'left'});
		}
	    else if($(window).width() < 944)
	    {
	        $('#logo_template').css({'background-size':' 120px 20px',
	    	'background-repeat':' no-repeat','width':'120px','height':'42px','margin-top':'20px','margin-left':'6px'});
	    }else if($(window).width() < 768) {
	        $('#logo_template').css({'background-size':' 170px 50px',
	    	'background-repeat':' no-repeat','width':'170px','height':'56px','margin-top':'6px','float':'left'});
	    }
	}

	$('.pick-a-color').pickAColor({
	    showSpectrum            : true,
		showSavedColors         : true,
		saveColorsPerElement    : true,
		fadeMenuToggle          : true,
		showAdvanced			: true,
		showBasicColors         : true,
		showHexInput            : true,
		allowBlank				: true,
		inlineDropdown			: true
	});

	$('#bg_h').change(function(){
		var bg_header_footer = $('#bg_h').val();
		$('#header_template').css('background','#'+bg_header_footer);
		$("#footer_template").css("background","#"+bg_header_footer);
	});

	$('#bg_a').change(function(){
		var bg_aplicacion = $('#bg_a').val();
		$('#aplicacion_template').css('background','#'+bg_aplicacion);
	});

	/*Logo*/
	$('.v_previa').hover(
	    function() {
	        $(this).find('a').fadeIn();
	    }, function() {
	        $(this).find('a').fadeOut();
	    }
	);

	$('#logo-select').on('click', function(e) {
	     e.preventDefault();
	    $('#logo').click();
	});

	$('#logo').change(function() {
	    var file = (this.files[0].name).toString();
	    var reader = new FileReader();
	    if (validar_imagenes(file) == true){
	    
		    $('#logo-info').text('');
		    $('#logo-info').text(file.substring(0, 10)+'... (JPG,PNG,GIF)');
	    
		    reader.onload = function (e) {
		        $('#v_previa_1 img').attr('src', e.target.result);
		        $('#logo_footer img').attr('src', e.target.result);
		        $('#logo_template').css({'background':'url("'+e.target.result+'")','background-size':' 170px 50px',
		    	'background-repeat':' no-repeat','width':'170px','height':'56px','margin-top':'6px','float':'left'});
		    	checkPosition();
			}
			reader.readAsDataURL(this.files[0]);
		}
		else{
			$('#logo-info').text('La extensión del archivo no esta permitida');
			reader.onload = function (e) {
		        $('#v_previa_1 img').attr('src', '/assets/logo_v.png');
		        $('#logo_footer img').attr('src','/assets/logo_template.png');
		        $('#logo_template').css({'background':'url("/assets/logo_template.png")','background-size':' 170px 50px',
		    	'background-repeat':' no-repeat','width':'170px','height':'56px','margin-top':'6px','float':'left'});
		    	checkPosition();
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	/*Favicon*/

	$('#favicon-select').on('click', function(e) {
	     e.preventDefault();
	    $('#favicon').click();
	});

	$('#favicon').change(function() {
	    var file = (this.files[0].name).toString();
	    var reader = new FileReader();
	    if (validar_favicon(file) == true){
		    $('#favicon-info').text('');
		    $('#favicon-info').text(file.substring(0, 10)+'... (JPG,PNG,GIF)');
		    
		    reader.onload = function (e) {
		    	$('#v_previa_2 img').attr('src', e.target.result);
		    	$('link[rel="shortcut icon"]').attr('href',e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
		else{
			$('#favicon-info').text('La extensión del archivo no esta permitida');
			reader.onload = function (e) {
		    	$('#v_previa_2 img').attr('src', '/assets/favicon_v.png');
		    	$('link[rel="shortcut icon"]').attr('href','/assets/favicon_template.png');
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	/*Slider*/

	$('#slider1-select').on('click', function(e) {
	     e.preventDefault();
	    $('#slider1').click();
	});

	$('#slider1').change(function() {
	    var file = (this.files[0].name).toString();
	    var reader = new FileReader();
	    if (validar_imagenes(file) == true){
	    
		    $('#slider1-info').text('');
		    $('#slider1-info').text(file.substring(0, 10)+'... (JPG,PNG,GIF)');
		    
		    reader.onload = function (e) {
		    	$('#v_previa_3 img').attr('src', e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
		else{
			$('#slider1-info').text('La extensión del archivo no esta permitida');
			reader.onload = function (e) {
		    	$('#v_previa_3 img').attr('src', '/assets/slider1_v.png');
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	$('#slider2-select').on('click', function(e) {
	     e.preventDefault();
	    $('#slider2').click();
	});

	$('#slider2').change(function() {
	    var file = (this.files[0].name).toString();
	    var reader = new FileReader();
	    if (validar_imagenes(file) == true){
		    $('#slider2-info').text('');
		    $('#slider2-info').text(file.substring(0, 10)+'... (JPG,PNG,GIF)');
		    
		    reader.onload = function (e) {
		    	$('#v_previa_4 img').attr('src', e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
		else{
			$('#slider2-info').text('La extensión del archivo no esta permitida');
			reader.onload = function (e) {
		    	$('#v_previa_4 img').attr('src', '/assets/slider2_v.png');
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	$('#slider3-select').on('click', function(e) {
	     e.preventDefault();
	    $('#slider3').click();
	});

	$('#slider3').change(function() {
	    var file = (this.files[0].name).toString();
	    var reader = new FileReader();
	    if (validar_imagenes(file) == true){
		    $('#slider3-info').text('');
		    $('#slider3-info').text(file.substring(0, 10)+'... (JPG,PNG,GIF)');
		    
		    reader.onload = function (e) {
		    	$('#v_previa_5 img').attr('src', e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
		else{
			$('#slider3-info').text('La extensión del archivo no esta permitida');
			reader.onload = function (e) {
		    	$('#v_previa_5 img').attr('src', '/assets/slider3_v.png');
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	function validar_favicon(file){
		var extension = (file.substring(file.lastIndexOf("."))).toLowerCase(); 
	    var extensiones_permitidas = new Array(".gif", ".png",".ico");
	    permitida = false; 
      	for (var i = 0; i < extensiones_permitidas.length; i++) { 
	        if (extensiones_permitidas[i] == extension) { 
		        permitida = true; 
		        break; 
        	} 
      	} 
	    return permitida;
	}

	function validar_imagenes(file){
		var extension = (file.substring(file.lastIndexOf("."))).toLowerCase(); 
	    var extensiones_permitidas = new Array(".gif", ".png", ".jpg");
	    permitida = false; 
      	for (var i = 0; i < extensiones_permitidas.length; i++) { 
	        if (extensiones_permitidas[i] == extension) { 
		        permitida = true; 
		        break; 
        	} 
      	} 
	    return permitida;
	}

	$('#salir_template').on('click', function(e) {
		//$(location).attr('href','http://localhost:3000/www.'<%session[:nom_enterprise]%>'.atlascrm.com');
		window.history.back(1);
	});

});