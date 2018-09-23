$(document).ready(function() {
  $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
  /**obtenemos el listado de las ciudades */
  $.get("work/php/inventario/obtener/obtener_categoria.php", function(data) {
    $("#marcaCategoria, #marcaEditarCategoria").append(data);
  });
  /**obtenemos el listado de categorias capturadas */
  var listaTablaMarca = $("#tablaListadoMarcas").DataTable({
    responsive: true,
    language: {
      url: "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
    },
    dom: "Bfrtip",
    buttons: [
      {
        extend: "pdfHtml5",
        title: "Listado de marcas"
      },
      {
        extend: "excelHtml5",
        title: "Listado de marcas"
      }
    ],
    ajax: {
      url: "work/php/inventario/obtener/marca_obtener_lista.php",
      dataType: "json"
    },
    columnDefs: [
      {
        targets: -1,
        data: null,
        defaultContent:
          "<button class='btn btn-warning btn-xs btn-block' data-toggle='tooltip' data-placement='top' title='Tooltip on top'>" +
          "<i class='fa fa-pencil-square-o' aria-hidden='true' id='editar'></i> Editar marca</button>"
      }
    ],
    columns: [
      { data: "categoria" },
      { data: "nombre" },
      { data: "descripcion" },
      { data: "activo" },
      { data: "fecha_registro" },
      { data: null }
    ]
  });
  $("#tablaListadoMarcas tbody").on("click", "button", function() {
    var data = listaTablaMarca.row($(this).parents("tr")).data();
    $("#modalEditar").modal("toggle");
    $("#modalTitulo").text("Editar marca: " + data["nombre"]);
    $("#marcaEditarNombre").val(data["nombre"]);
    $("#marcaEditarId").val(data["id_marca"]);
    $("#marcaEditarDescripcion").val(data["descripcion"]);
    $("#marcaEditarActivo")
      .val(data["activo_bool"])
      .change();
    $("#marcaEditarCategoria")
      .val(data["id_categoria"])
      .change();
  });
  /** actualizar marca */
  $("#marcaEditarForma").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
    rules: {
      marcaEditarCategoria: "required",
      marcaEditarNombre: "required",
      marcaEditarDescripcion: "required",
      marcaEditarActivo: "required"
    },
    messages: {
      marcaEditarCategoria: "Es obligatorio asignar una categoria",
      marcaEditarNombre: "Es obligatorio asignar un nombre",
      marcaEditarDescripcion: "La descripción es obligatoria",
      marcaEditarActivo: "Este campo es obligatorio!"
    },
    submitHandler: function(form) {
      var dataString = $("#marcaEditarForma").serialize();
      $("#modalEditar").modal("toggle");
      $.ajax({
        type: "POST",
        url: "work/php/inventario/actualiza/marca_actualizar.php",
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
                      "work/php/inventario/vistas/marca_altas.php"
                    );
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
                      "work/php/inventario/vistas/marca_altas.php"
                    );
                    $("#categoriaNombre").focus();
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
  /**agregar categoria */
  $("#marcaNombre").focus();
  $("#marcaForma").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
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
    submitHandler: function(form) {
      var dataString = $("#marcaForma").serialize();
      $.ajax({
        type: "POST",
        url: "work/php/inventario/insertar/marca_insertar.php",
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
                      "work/php/inventario/vistas/marca_altas.php"
                    );
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
                      "work/php/inventario/vistas/marca_altas.php"
                    );
                    $("#marcaNombre").focus();
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
