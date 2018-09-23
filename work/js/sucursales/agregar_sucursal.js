$(document).ready(function () {
    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
    $.get("work/php/sucursales/obtener/obtener_ciudades.php", function (data) {        
        $('#sucursalCiudad').append(data);
    });    
    $('#sucursalNombre').focus();
    $('#sucursalTelefono').inputmask('(999) 999 9999');
    /**Check for user login */
    $("#sucursalForma").validate({
        debug: true,
        errorClass: 'parsley-error',
        errorPlacement: function (error, element) {
            return true;
        },
        rules: {
            sucursalNombre: "required",
            sucursalDireccion: "required",
            sucursalTelefono: "required",
            sucursalCiudad: "required",
            sucursalActivo: "required"
        },
        submitHandler: function (form) {
            var dataString = $('#sucursalForma').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/sucursales/insertar/agregar_sucursal.php",
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
                                        $('#main_area').load("work/php/sucursales/vistas/sucursales_altas.php");
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
                                        $('#main_area').load("work/php/sucursales/vistas/sucursales_altas.php");
                                        $('#sucursalCiudad').focus();
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