$(function (){

    $('#bt_buscar_roles').on('click',function(){
        var nombre = $('#txtbuscar_roles').val();
        
        $.ajax({
            url: '/roles/buscar_roles',
            dataType: 'html',
            data: {nom_rol: nombre},
            type: 'GET',
            success: function(data){
                $('#resultados2').html(data).fadeIn('slow');
            }
        });
    });
    
});