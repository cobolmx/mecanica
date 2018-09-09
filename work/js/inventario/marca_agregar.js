$(document).ready(function () {
     /**obtenemos el listado de las ciudades */
     $.get("work/php/inventario/obtener/obtener_categoria.php", function (data) {
        $('#marcaCategoria').append(data);
    });
    /**obtenemos el listado de categorias capturadas */
    $('#tablaListadoMarcas').DataTable({
        responsive: true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'pdfHtml5',
                title: 'Listado de marcas'
            },
            {
                extend: 'excelHtml5',
                title: 'Listado de marcas'
            }
        ],
        "ajax": {
            url: "work/php/inventario/obtener/marca_obtener_lista.php",
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
    $('#marcaNombre').focus();
    $("#marcaForma").validate({
        debug: false,
        errorClass: 'text-danger parsley-error',
        rules: {
            marcaCategoria: "required",
            marcaNombre: "required",
            marcaDescripcion: "required",
            marcaActivo: "required"
        },
        messages: {
            marcaCategoria: "Es obligatorio seleccionar una categoría",
            marcaNombre: "Es obligatorio asignar un nombre",
            marcaDescripcion: "La descripción es obligatoria",
            marcaActivo: "Es obligatorio seleccionar una opción"
        },
        submitHandler: function (form) {
            var dataString = $('#marcaForma').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/inventario/insertar/marca_insertar.php",
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
                                        $('#main_area').load("work/php/inventario/vistas/marca_altas.php");
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
                                        $('#main_area').load("work/php/inventario/vistas/marca_altas.php");
                                        $('#marcaNombre').focus();
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