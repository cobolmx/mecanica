$(document).ready(function () {
    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

    /**Check for user login */
    $("#usuarioPasswordForma").validate({
        debug: false,
        errorClass: 'text-danger parsley-error',
        rules: {
            usuarioPassword: {
                required: true,
                minlength: 6
            },
            usuarioPassword2: {
                required: true,
                minlength: 6,
                equalTo: '#usuarioPasswordx'
            }
        },
        messages: {
            usuarioPassword: {
                required: "Este campo es obligatorio!",
                minlength: "La contraseña debe de ser al menos de 6 caracteres.",
                equalTo: "Las contraseñas no coinciden."
            },
            usuarioPassword2: {
                required: "Este campo es obligatorio!",
                minlength: "La contraseña debe de ser al menos de 6 caracteres.",
                equalTo: "Las contraseñas no coinciden."
            }
        },
        submitHandler: function (form) {
            var dataString = $('#usuarioPasswordForma').serialize();            
            $.ajax({
                type: "POST",
                url: "work/php/usuario/actualiza/actualiza_password.php",
                data: dataString,
                dataType: "json",               
                success: function (result) {
                    switch (result['data'].status) {
                        case 'success':
                            swal({
                                title: "Mensaje de Mecanica: ",
                                text: result['data'].message,
                                icon: 'success',
                                closeOnClickOutside: false,
                                buttons: {
                                    Continuar: true
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Continuar":
                                        $('#main_area').load("work/php/usuario/vistas/usuario_password.php");
                                        break;
                                }
                            });
                            break;                      
                        case 'error':
                            swal({
                                title: "Mensaje de Mecanica: ",
                                text: result['data'].message,
                                icon: 'error',
                                closeOnClickOutside: false,
                                buttons: {
                                    Continuar: true
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Continuar":
                                        $('#main_area').load("work/php/usuario/vistas/usuario_password.php");
                                        // $('#usuarioPassword').focus();
                                        break;
                                }
                            });
                            break;
                    }
                }
            });
            return false; // required to block normal submit since you used ajax            
        }
    });
});