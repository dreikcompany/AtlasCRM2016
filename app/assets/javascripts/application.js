// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require moment
//= require bootstrap-datetimepicker

$(function () {
    $("#element").introLoader({
        animation: {
            name: 'lettersLoader',
            options: {
                exitFx:'slideUp',
                ease: "easeInOutCirc",
                style: 'dark',
                delayBefore: 300,
                delayAfter: 0,
                exitTime: 100,
                loaderText: 'Bienvenido!', 
                lettersDelayTime: 0,
            }
        },
        spinJs: {
            lines: 13, // The number of lines to draw
            length: 20, // The length of each line
            radius: 30, // The radius of the inner circle
            width: 10, // The line thickness
            color: '#FFF' // #rgb or #rrggbb or array of colors
        }
    });

    if ( $('#element').length > 0 ) {
        var loader = $('#element').data('introLoader');
        loader.stop();
    }
    

    $('#element_template').introLoader({
        animation: {
            name: 'simpleLoader',
            options: {
                effect:'slideUp',
                ease: "easeInOutCirc",
                style: 'dark',
                delayTime: 1000, //delay time in milliseconds
                animationTime: 500
                
            }
        },    
        spinJs: {
            lines: 13, // The number of lines to draw
            length: 20, // The length of each line
            width: 10, // The line thickness
            radius: 30, // The radius of the inner circle
            corners: 1, // Corner roundness (0..1)
            color: '#fff', // #rgb or #rrggbb or array of colors
        }
    });

    if ( $('#element_template').length > 0 ) {
        var loader = $('#element_template').data('introLoader');
        loader.stop();
    }

    $('#datetimepicker6').datetimepicker();
    $('#datetimepicker7').datetimepicker({
        useCurrent: false //Important! See issue #1075
    });
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });


    function carga_template(){
        var bg_h_f = $('#c_bg_h_f').val();
        var bg_a = $('#c_bg_a').val();
        var logo = $('#c_logo').val();
        var slider1 = $('#c_slider1').val();
        var slider2 = $('#c_slider2').val();
        var slider3 = $('#c_slider3').val();
        var t_slider1 = $('#c_t_slider1').val();
        var t_slider2 = $('#c_t_slider2').val();
        var t_slider3 = $('#c_t_slider3').val();
        var favicon = $('#c_favicon').val();
       
        $('#header_template').css('background','#'+bg_h_f);
        $('#modal_header_template').css('background','#'+bg_h_f);
        $('#modal_header_template2').css('background','#'+bg_h_f);
        $('#footer_template').css('background','#'+bg_h_f);
        $('#modal_footer_template').css('background','#'+bg_h_f);
        $('#modal_footer_template2').css('background','#'+bg_h_f);
        $('#aplicacion_template').css('background','#'+bg_a);
        $('#modal_body_template').css('background','#'+bg_a);
        $('#modal_body_template2').css('background','#'+bg_a);
        $('#logo_footer img').attr('src',logo);
        $('#logo_template').css({'background':'url("'+logo+'")','background-size':' 170px 50px',
        'background-repeat':' no-repeat','width':'170px','height':'56px','margin-top':'6px','float':'left'});
        $('#logo_login_template').css({'background':'url("'+logo+'")','background-size':' 140px 40px',
        'background-repeat':' no-repeat','width':'140px','height':'40px'});
        $('#logo_login_template2').css({'background':'url("'+logo+'")','background-size':' 140px 40px',
        'background-repeat':' no-repeat','width':'140px','height':'40px'});
        $('link[rel="shortcut icon"]').attr('href',favicon);
        $('#slider1_template img').attr('src', slider1);      
        $('#slider2_template img').attr('src', slider2);
        $('#slider3_template img').attr('src', slider3);
        
    }
    carga_template(); 
});


