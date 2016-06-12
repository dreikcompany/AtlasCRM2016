$(function (){
    $('#bt_buscar_promotions').on('click',function(){
        var nombre = $('#txtbuscar_promotions').val();
        
        $.ajax({
            url: '/promotion_afiliations/buscar_promociones',
            dataType: 'html',
            data: {nombre: nombre},
            type: 'GET',
            success: function(data){
                $('#result_promotions').html(data).fadeIn('slow');
            }
        });
    });
    
});