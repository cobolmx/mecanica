$(document).ready(function () {
    $('#btnActualiza').prop('disabled', true);
    /**obtenemos el listado de las ciudades */
    $.get("work/php/sucursales/obtener/obtener_ciudades.php", function (data) {
        $('#empleadoCiudad').append(data);
    });
    $.get("work/php/empleados/obtener/obtener_rol.php", function (data) {
        $('#empleadoRol').append(data);
    });
    $('#empleadoCiudad').on('change', function () {
        $('#empleadoSucursal').find('option').remove().end().append('<option value="">Selecione una sucursal</option>');
        $.get("work/php/empleados/obtener/obtener_sucursal.php", { ciudad: this.value }, function (data) {
            $('#empleadoSucursal').append(data);
        });
    });
    /**mascaras para los numero de telefono y seguro social */
    $('.mascara-telefono').inputmask('(999) 999 9999');
    $('#empleadoNss').inputmask('NSS:99-99-99-9999-9');
    $('#empleadoRfc').inputmask('aaaa-999999-***');
    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
    // $('#empleadoNombre').focus();
    $("#searchForm").validate({
        debug: false,
        errorClass: 'text-danger parsley-error',
        rules: {
            searchInfo: {
                required: true
            }
        },
        errorPlacement: function () {
            return false;
        },
        submitHandler: function (form) {
            var dataString = $('#searchForm').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/empleados/obtener/obtener_empleado.php",
                data: dataString,
                dataType: "json",
                success: function (result) {
                    $("#empleadoNUmeroEmpleado").val("");
                    $('#empleadoNombre').val('');
                    $('#empleadoPaterno').val('');
                    $('#empleadoMaterno').val('');
                    $('#empleadoCorreo').val('');
                    $('#empleadoRfc').val('');
                    $('#empleadoNss').val('');
                    $('#empleadoCorreoOriginal').val('');
                    $('#empleadoRfcOriginal').val('');
                    $('#empleadoNssOriginal').val('');
                    $('#empleadoCiudad').val('').change();
                    $('#empleadoTelefonoCasa').val('');
                    $('#empleadoTelefonoCelular').val('');
                    $('#empleadoTelefonoEmergencia').val('');
                    $('#empleadoDomicilio').val('');
                    $('#empleadoFechaIngreso').val('');
                    $('#empleadoRol').val('').change();
                    $('#empleadoActivar').val('').change();
                    $('#empleadoComentarios').val('');
                    $('#empleadoDomicilio').val('');
                    switch (result['data'].status) {
                        case 'success':
                            swal({
                                title: "Mensaje de Mecanica:  ",
                                text: result['data'].message,
                                icon: 'success',
                                closeOnClickOutside: false,
                                buttons: {
                                    Continuar: true
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Continuar":
                                        $('#empleadoNombreCompleto').text('Información de: ' + result['data'].nombre_completo);
                                        $('#empleadoNumeroEmpleado').val(result['data'].numero_empleado);
                                        $('#empleadoNombre').val(result['data'].nombre);
                                        $('#empleadoPaterno').val(result['data'].paterno);
                                        $('#empleadoMaterno').val(result['data'].materno);
                                        $('#empleadoCorreo').val(result['data'].correo_electronico);
                                        $('#empleadoRfc').val(result['data'].rfc);
                                        $('#empleadoNss').val(result['data'].nss);
                                        $('#empleadoCorreoOriginal').val(result['data'].correo_electronico);
                                        $('#empleadoRfcOriginal').val(result['data'].rfc);
                                        $('#empleadoNssOriginal').val(result['data'].nss);
                                        $('#empleadoTelefonoCasa').val(result['data'].telefono_casa);
                                        $('#empleadoTelefonoCelular').val(result['data'].telefono_celular);
                                        $('#empleadoTelefonoEmergencia').val(result['data'].telefono_emergencia);
                                        $('#empleadoFechaIngreso').val(result['data'].fecha_ingreso);
                                        $('#empleadoCiudad').val(result['data'].ciudad).change();
                                        $('#empleadoDomicilio').val(result['data'].domicilio);
                                        /** delay para cargar el chainded select */
                                        setTimeout(function () {
                                            $('#empleadoSucursal').val(result['data'].sucursal).change();
                                        }, 100);
                                        $('#empleadoRol').val(result['data'].tipo_usuario).change();
                                        $('#empleadoActivo').val(result['data'].activo).change();
                                        $('#empleadoComentarios').val(result['data'].comentarios);
                                        $('#btnActualiza').prop('disabled', false);
                                        break;
                                }
                            });
                            break;
                        case 'warning':
                            swal({
                                title: "Mensaje de Mecanica:  ",
                                text: result['data'].message,
                                icon: 'warning',
                                closeOnClickOutside: false,
                                buttons: {
                                    Continuar: true
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Continuar":
                                        $('#searchInfo').val('');
                                        $('#searchInfo').focus();
                                        break;
                                }
                            });
                            break;
                        case 'error':
                            swal({
                                title: "Mensaje de Mecanica:  ",
                                text: result['data'].message,
                                icon: 'error',
                                closeOnClickOutside: false,
                                buttons: {
                                    Continuar: true
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Continuar":
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

    /**Check for user login */
    $("#empleadoForma").validate({
        debug: false,
        errorClass: 'text-danger parsley-error',
        // errorPlacement: function() {
        //     return false;
        // }, 
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
            empleadoCiudad: "required",
            empleadoPassword2: {
                // required: true,
                minlength: 6,
                equalTo: '#empleadoPassword'
            },
            empleadoActivo: "required"
        },
        messages: {
            empleadoNombre: "Este campo es obligatorio!",
            empleadoPaterno: "Este campo es obligatorio!",
            empleadoMaterno: "Este campo es obligatorio!",
            empleadoCorreo: "Este campo es obligatorio!",
            empleadoCiudad: "Este campo es obligatorio!",
            empleadoRfc: "Este campo es obligatorio!",
            empleadoNss: "Este campo es obligatorio!",
            empleadoDomicilio: "Este campo es obligatorio!",
            empleadoActivo: "Este campo es obligatorio!",
            empleadoPassword2: {
                minlength: "La contraseña debe de ser al menos de 6 caracteres.",
                equalTo: "Las contraseñas no coinciden."
            }
        },
        submitHandler: function (form) {
            var dataString = $('#empleadoForma').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/empleados/actualiza/actualiza_empleado.php",
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
                                        $('#main_area').load("work/php/empleados/vistas/empleados_modificaciones.php");
                                        break;
                                }
                            });
                            break;
                        case 'exist':
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
                                        $('#' + result['data'].focus).focus();
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
                                        $('#main_area').load("work/php/empleados/vistas/empleados_modificaciones.php");
                                        $('#searchInfo').focus();
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