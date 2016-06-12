jQuery(document).ready(function($) {

	if( $('#slider').length > 0 ){
    $('#slider').bjqs({
 
         
// PARAMETROS OPCIONALES QUE NOS OFRECE EL PLUGIN
width : 1920,
height : 600,
 
// animation values
animtype : 'fade', // accepts 'fade' or 'slide'
animduration : 500, // how fast the animation are
animspeed : 5000, // the delay between each slide
automatic : true, // automatic
 
// control and marker configuration
showcontrols : true, // show next and prev controls
centercontrols : true, // center controls verically
nexttext : '<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>', // Text for 'next' button (can use HTML)
prevtext : '<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>', // Text for 'previous' button (can use HTML)
showmarkers : false, // Show individual slide markers
centermarkers : true, // Center markers horizontally
 
// interaction values
keyboardnav : true, // enable keyboard navigation
hoverpause : true, // pause the slider on hover
 
// presentational options
usecaptions : true, // show captions for images using the image title tag
responsive : true // enable responsive capabilities (beta)
    });
    }
    else{
    	console.log('hola');
    }
});
