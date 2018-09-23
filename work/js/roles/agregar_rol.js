$(document).ready(function () {
    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
    $('#rolNombre').focus();
    /**Check for user login */
    $("#rolForma").validate({
        debug: true,
        errorClass: 'parsley-error',
        errorPlacement: function (error, element) {
            return true;
        },
        rules: {
            rolNombre: "required",            
            sucursalActivo: "required"
        },
        submitHandler: function (form) {
            var dataString = $('#rolForma').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/roles/insertar/agregar_rol.php",
                data: dataString,
                dataType: "json",
                success: function (result) {
                    console.log(result['data'].status);
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
                                        $('#main_area').load("work/php/roles/vistas/roles_altas.php");
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
                                        $('#main_area').load("work/php/roles/vistas/roles_altas.php");
                                        $('#rolNombre').focus();
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