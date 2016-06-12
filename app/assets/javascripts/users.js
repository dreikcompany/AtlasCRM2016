$(function (){

    $('#nom_user').keyup(function(){
        var user = $('#nom_user').val().trim();
        if (user != '' || user.lenght>0){  
            $.ajax({
                url: '/users/validate_user',
                dataType: 'html',
                data: {nom_user: user},
                type: 'GET',
                success: function(data){
                    $('#resultados').html(data).fadeIn('slow');
                }
            });
        }
        else{
            $('#resultados').html('').fadeIn('slow');
        }
    });
    
});
