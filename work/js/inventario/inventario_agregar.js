$(document).ready(function() {
  $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
  /**obtenemos el listado de las ciudades */
  $.get("work/php/inventario/obtener/obtener_categoria.php", function(data) {
    $("#inventarioCategoria").append(data);
  });
  $("#inventarioCategoria").on("change", function() {
    $("#inventarioMarca")
      .find("option")
      .remove()
      .end()
      .append('<option value="">Selecione una marca</option>');
    $.get(
      "work/php/inventario/obtener/obtener_marca_chained.php",
      { id_categoria: this.value },
      function(data) {
        $("#inventarioMarca").append(data);
      }
    );
  });
  $("#inventarioMarca").on("change", function() {
    $("#inventarioModelo")
      .find("option")
      .remove()
      .end()
      .append('<option value="">Selecione una modelo</option>');
    $.get(
      "work/php/inventario/obtener/obtener_modelo_chained.php",
      { id_marca: this.value },
      function(data) {
        $("#inventarioModelo").append(data);
      }
    );
  });
  /** indicamos que no sea 0 en agregar la cantidad de articulos */
  // $("#inventarioCantidad").attr({
  //     "min": 1          // values (or variables) here
  // });
  /**obtenemos el listado de categorias capturadas */
  // $('#tablaListadoMarcas').DataTable({
  //     responsive: true,
  //     "language": {
  //         "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
  //     },
  //     dom: 'Bfrtip',
  //     buttons: [
  //         {
  //             extend: 'pdfHtml5',
  //             title: 'Listado de marcas'
  //         },
  //         {
  //             extend: 'excelHtml5',
  //             title: 'Listado de marcas'
  //         }
  //     ],
  //     "ajax": {
  //         url: "work/php/inventario/obtener/marca_obtener_lista.php",
  //         dataType: "json"
  //     },
  //     "columns": [
  //         { "data": "categoria"},
  //         { "data": "nombre" },
  //         { "data": "descripcion" },
  //         { "data": "activo" },
  //         { "data": "fecha_registro" }
  //     ]
  // });

  /**agregar categoria */
  // $('#marcaNombre').focus();
  $("#inventarioForma").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
    rules: {
      inventarioCategoria: "required",
      inventarioMarca: "required",
      inventarioModelo: "required",
      inventarioSerie: "required",
      inventarioActivo: "required"
    },
    messages: {
      inventarioCategoria: "Es necesario seleccionar una categoria.",
      inventarioMarca: "Es necesario seleccionar una marca.",
      inventarioModelo: "Es necesario seleccionar un modelo.",
      inventarioSerie: "Es necesario ingresar un número de serie.",
      inventarioActivo: "Seleccione una opción."
    },
    submitHandler: function(form) {
      var dataString = $("#inventarioForma").serialize();
      $.ajax({
        type: "POST",
        url: "work/php/inventario/insertar/inventario_insertar.php",
        data: dataString,
        dataType: "json",
        success: function(result) {
          switch (result["data"].status) {
            case "success":
              swal({
                title: "Mensaje de Mecanica: ",
                text: result["data"].message,
                icon: "success",
                closeOnClickOutside: false,
                buttons: {
                  Continuar: true
                }
              }).then(value => {
                switch (value) {
                  case "Continuar":
                    $("#main_area").load(
                      "work/php/inventario/vistas/inventario_altas.php"
                    );
                    break;
                }
              });
              break;
            case "exist":
              swal({
                title: "Mensaje de Mecanica: ",
                text: result["data"].message,
                icon: "error",
                closeOnClickOutside: false,
                buttons: {
                  Continuar: true
                }
              }).then(value => {
                switch (value) {
                  case "Continuar":                    
                    $("#" + result["data"].focus).focus();
                    break;
                }
              });
              break;
            case "error":
              swal({
                title: "Mensaje de Mecanica: ",
                text: result["data"].message,
                icon: "error",
                closeOnClickOutside: false,
                buttons: {
                  Continuar: true
                }
              }).then(value => {
                switch (value) {
                  case "Continuar":
                    $("#main_area").load(
                      "work/php/inventario/vistas/inventario_altas.php"
                    );
                    $("#inventarioCategoria").focus();
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
