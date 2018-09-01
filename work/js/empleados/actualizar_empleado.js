$(document).ready(function () {
    /**obtenemos el listado de las ciudades */
    $.get("work/php/sucursales/obtener/obtener_ciudades.php", function (data) {
        $('#empleadoCiudad').append(data);
    });
    $.get("work/php/empleados/obtener/obtener_rol.php", function (data) {
        $('#empleadoRol').append(data);
    });
    /**mascaras para los numero de telefono y seguro social */
    $('.mascara-telefono').inputmask('(999) 999 9999');
    $('#empleadoNss').inputmask('NSS:99-99-99-9999-9');
    $('#empleadoRfc').inputmask('aaaa-999999-***');

    // $('#empleadoNombre').focus();
    $("#searchForm").validate({
        debug: false,
        errorClass: 'text-danger parsley-error',
        rules: {
            searchInfo: {
                required: true
            }
        },  
        errorPlacement: function() {
            return false;
        },     
        submitHandler: function (form) {
            var dataString = $('#searchForm').serialize();
            console.log('fired');
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
                    $('#empleadoCiudad').val('').change();
                    $('#empleadoTelefonoCasa').val('');
                    $('#empleadoTelefonoCelular').val('');
                    $('#empleadoTelefonoEmergencia').val('');
                    $('#empleadoDomicilio').val('');
                    $('#empleadoFechaIngreso').val('');
                    $('#empleadoRol').val('').change();
                    $('#empleadoActivar').val('').change();
                    $('#empleadoComentarios').val('');
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
                                    $('#empleadoNombreCompleto').text(result['data'].nombre + ' ' + result['data'].paterno + ' ' + result['data'].materno);
                                        // $('#updateInfo').prop('disabled', false);
                                        // $('#name').val(result['data'].name);
                                        // $('#lastName').val(result['data'].last_name);
                                        // $('#maidenLastName').val(result['data'].maiden_last_name);
                                        // $('#username').val(result['data'].username);
                                        // $('#email').val(result['data'].email);
                                        // $('#oldEmail').val(result['data'].email);
                                        // $('#employeeNunber').val(result['data'].employee_number);
                                        // $('#selectDepartment').val(result['data'].id_department).change();
                                        // $('#selectRole').val(result['data'].id_role).change();
                                        // $('#selectOffice').val(result['data'].id_office).change();
                                        // $('#cardImage').attr('src', result['data'].avatar);
                                        // $('#fullName').text(result['data'].name + ' ' + result['data'].last_name + ' ' + result['data'].maiden_last_name);
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
            empleadoPassword: {
                required: true,
                minlength: 6
            },
            empleadoPassword2: {
                required: true,
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
            empleadoPassword: {
                required: "Este campo es obligatorio!",
                minlength: "La contraseña debe de ser al menos de 6 caracteres.",
                equalTo: "Las contraseñas no coinciden."
            },
            empleadoPassword2: {
                required: "Este campo es obligatorio!",
                minlength: "La contraseña debe de ser al menos de 6 caracteres.",
                equalTo: "Las contraseñas no coinciden."
            }
        },
        submitHandler: function (form) {
            var dataString = $('#empleadoForma').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/empleados/insertar/agregar_empleado.php",
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
                                        // $('#main_area').load("work/php/empleados/vistas/empleados_altas.php");
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