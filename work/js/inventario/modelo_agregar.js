$(document).ready(function () {
     /**obtenemos el listado de las ciudades */
     $.get("work/php/inventario/obtener/obtener_categoria.php", function (data) {
        $('#modeloCategoria').append(data);
    });
    /**obtenemos el listado de categorias capturadas */
    $('#tablaListadoModelos').DataTable({
        responsive: true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'pdfHtml5',
                title: 'Listado de modelos'
            },
            {
                extend: 'excelHtml5',
                title: 'Listado de modelos'
            }
        ],
        "ajax": {
            url: "work/php/inventario/obtener/modelo_obtener_lista.php",
            dataType: "json"
        },
        "columns": [
            { "data": "categoria"},
            { "data": "nombre" },
            { "data": "descripcion" },
            { "data": "activo" },
            { "data": "fecha_registro" }
        ]
    });

    /**agregar categoria */
    $('#modeloNombre').focus();
    $("#modeloForma").validate({
        debug: false,
        errorClass: 'text-danger parsley-error',
        rules: {
            modeloCategoria: "required",
            modeloNombre: "required",
            modeloDescripcion: "required",
            modeloActivo: "required"
        },
        messages: {
            modeloCategoria: "Es obligatorio seleccionar una categoría",
            modeloNombre: "Es obligatorio asignar un nombre",
            modeloDescripcion: "La descripción es obligatoria",
            modeloActivo: "Es obligatorio seleccionar una opción"
        },
        submitHandler: function (form) {
            var dataString = $('#modeloForma').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/inventario/insertar/modelo_insertar.php",
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
                                        $('#main_area').load("work/php/inventario/vistas/modelo_altas.php");
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
                                        $('#main_area').load("work/php/inventario/vistas/modelo_altas.php");
                                        $('#modeloNombre').focus();
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