$(document).ready(function () {
    /**obtenemos el listado de las ciudades */
    $.get("work/php/sucursales/obtener/obtener_ciudades.php", function (data) {
        $('#empleadoCiudad').append(data);
    });
    /**mascaras para los numero de telefono y seguro social */
    $('.mascara-telefono').inputmask('(999) 999 9999');
    $('#empleadoNumeroSeguroSocial').inputmask('NSS:99-99-99-9999-9');
    $('#empleadoRfc').inputmask('aaaa-999999-***');

    $('#empleadoNombre').focus();
    moment.locale('es');
    $('#empleadoFechaIngreso').daterangepicker({
        singleDatePicker: true,
        locale: {
            format: 'YYYY-MM-DD'
        }

    });    
    /**Check for user login */
    $("#empleadoForma").validate({
        debug: true,
        errorClass: 'text-danger parsley-error',
        errorPlacement: function() {
            return true;
        }, 
        rules: {
            empleadoNombre: "required",
            empleadoPaterno: "required",
            empleadoMaterno: "required",
            empleadoCorreo: {
                required: true,
                email: true                
            },
            sucursalActivo: "required",
            empleadoRfc: "required",
            empleadoNss: "required",
            empleadoFechaIngreso: "required",
            empleadoDomicilio: "required",
            empleadoCiudad: "required"
        },
        submitHandler: function (form) {
            var dataString = $('#empleadoForma').serialize();
            $.ajax({
                type: "POST",
                // url: "work/php/empleados/insertar/agregar_empleado.php",
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
                                        $('#main_area').load("work/php/empleados/vistas/empleados_altas.php");
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
                                        $('#main_area').load("work/php/empleados/vistas/empleados_altas.php");
                                        $('#empleadoNombre').focus();
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