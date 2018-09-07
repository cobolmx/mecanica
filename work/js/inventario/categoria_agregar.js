$(document).ready(function () {
    /**obtenemos el listado de categorias capturadas */
    $('#tablaListadoCategoria').DataTable({
        responsive: true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'pdfHtml5',
                title: 'Listado de categorias'
            },
            {
                extend: 'excelHtml5',
                title: 'Listado de categorias'
            }
        ],
        "ajax": {
            url: "work/php/inventario/obtener/categoria_obtener_lista.php",
            dataType: "json"
        },
        "columns": [
            { "data": "nombre" },
            { "data": "descripcion" },
            { "data": "activo" },
            { "data": "fecha_registro" }
        ]
    });

    /**agregar categoria */
    $('#categoriaNombre').focus();
    $("#categoriaForma").validate({
        debug: false,
        errorClass: 'text-danger parsley-error',
        rules: {
            categoriaNombre: "required",
            categoriaDescripcion: "required",
            categoriaActivo: "required"
        },
        messages: {
            categoriaNombre: "Es obligatorio asignar un nombre",
            categoriaDescripcion: "La descripción es obligatoria",
            categoriaActivo: "Este campo es obligatorio!"
        },
        submitHandler: function (form) {
            var dataString = $('#categoriaForma').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/inventario/insertar/categoria_insertar.php",
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
                                        $('#main_area').load("work/php/inventario/vistas/categoria_altas.php");
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
                                        $('#main_area').load("work/php/inventario/vistas/categoria_altas.php");
                                        $('#categoriaNombre').focus();
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