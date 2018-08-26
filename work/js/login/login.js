$(document).ready(function () {
    $('#numeroEmpleado').focus();
    /** Carga una bloque de espera en lo que termina de realizar el llamado*/    
    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
    /**Check for user login */
    $("#loginForm").validate({
        // debug: false,
        errorClass: 'parsley-error', 
        errorPlacement: function(error,element) {
            return true;
          }, 
        rules: {
            numeroEmpleado: "required",
            password: "required"
        },
        messages: {
            numeroEmpleado: "Favor de ingresar su número de empleado",
            password: "La contraseña es requerida"
        },
        submitHandler: function (form) {
            var dataString = $('#loginForm').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/login/login.php",
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
                                    Continuar: true,                                    
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Continuar":
                                    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
                                        window.location = "dashboard.php";
                                        break;
                                }
                            });
                            break;
                        case 'warning':
                            swal({
                                title: "Mensaje de Mecanica: ",
                                text: result['data'].message,
                                icon: 'warning',
                                closeOnClickOutside: false,
                                buttons: {
                                    Continuar: true
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Continuar":
                                        $('#numeroEmpleado').val('');
                                        $('#password').val('');
                                        $('#numeroEmpleado').focus();
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
                                        $('#numeroEmpleado').val('');
                                        $('#password').val('');
                                        $('#numeroEmpleado').focus();
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