$(document).ready(function() {
  $(document)
    .ajaxStart($.blockUI)
    .ajaxStop($.unblockUI);
  /**obtenemos el listado de las ciudades */
  $.get("work/php/inventario/obtener/obtener_marca.php", function(data) {
    $("#modeloMarca, #modeloEditarMarca").append(data);
  });
  /**obtenemos el listado de categorias capturadas */
  var listaTablaModelo = $("#tablaListadoModelos").DataTable({
    responsive: true,
    language: {
      url: "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
    },
    dom: "Bfrtip",
    buttons: [
      {
        extend: "pdfHtml5",
        title: "Listado de modelos"
      },
      {
        extend: "excelHtml5",
        title: "Listado de modelos"
      }
    ],
    ajax: {
      url: "work/php/inventario/obtener/modelo_obtener_lista.php",
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
      { data: "marca" },
      { data: "nombre" },
      { data: "descripcion" },
      { data: "activo" },
      { data: "fecha_registro" },
      { data: null }
    ]
  });
  $("#tablaListadoModelos tbody").on("click", "button", function() {
    var data = listaTablaModelo.row($(this).parents("tr")).data();
    $("#modalEditar").modal("toggle");
    $("#modalTitulo").text("Editar modelo: " + data["nombre"]);
    $("#modeloEditarNombre").val(data["nombre"]);
    $("#modeloEditarId").val(data["id_modelo"]);
    $("#modeloEditarDescripcion").val(data["descripcion"]);
    $("#modeloEditarActivo")
      .val(data["activo_bool"])
      .change();
    $("#modeloEditarMarca")
      .val(data["id_marca"])
      .change();
  });
  /** actualizar modelo */
  $("#modeloEditarForma").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
    rules: {
      modeloEditarMarca: "required",
      modeloEditarNombre: "required",
      modeloEditarDescripcion: "required",
      modeloEditarActivo: "required"
    },
    messages: {
      modeloEditarMarca: "Es obligatorio asignar una marca",
      modeloEditarNombre: "Es obligatorio asignar un nombre",
      modeloEditarDescripcion: "La descripción es obligatoria",
      modeloEditarActivo: "Este campo es obligatorio!"
    },
    submitHandler: function(form) {
      var dataString = $("#modeloEditarForma").serialize();
      console.log(dataString);
      $("#modalEditar").modal("toggle");
      $.ajax({
        type: "POST",
        url: "work/php/inventario/actualiza/modelo_actualizar.php",
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
                      "work/php/inventario/vistas/modelo_altas.php"
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
                      "work/php/inventario/vistas/modelo_altas.php"
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
  /**agregar modelo */
  $("#modeloNombre").focus();
  $("#modeloForma").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
    rules: {
      modeloMarca: "required",
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
    submitHandler: function(form) {
      var dataString = $("#modeloForma").serialize();
      $.ajax({
        type: "POST",
        url: "work/php/inventario/insertar/modelo_insertar.php",
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
                      "work/php/inventario/vistas/modelo_altas.php"
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
                      "work/php/inventario/vistas/modelo_altas.php"
                    );
                    $("#modeloNombre").focus();
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
