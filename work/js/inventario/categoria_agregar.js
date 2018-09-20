$(document).ready(function() {
  /**obtenemos el listado de categorias capturadas */
  var listaTabla = $("#tablaListadoCategoria").DataTable({
    responsive: true,
    language: {
      url: "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
    },
    dom: "Bfrtip",
    buttons: [
      {
        extend: "pdfHtml5",
        title: "Listado de categorias"
      },
      {
        extend: "excelHtml5",
        title: "Listado de categorias"
      }
    ],
    ajax: {
      url: "work/php/inventario/obtener/categoria_obtener_lista.php",
      dataType: "json"
    },
    columnDefs: [
      {
        targets: -1,
        data: null,
        defaultContent:
          "<button class='btn btn-warning btn-xs btn-block' data-toggle='tooltip' data-placement='top' title='Tooltip on top'>" +
          "<i class='fa fa-pencil-square-o' aria-hidden='true' id='editar'></i> Editar categoría</button>"
      }
    ],
    columns: [
      { data: "nombre" },
      { data: "descripcion" },
      { data: "activo" },
      { data: "fecha_registro" },
      { data: null }
    ]
  });
  $("#tablaListadoCategoria tbody").on("click", "button", function() {
    var data = listaTabla.row($(this).parents("tr")).data();
    $("#modalEditar").modal("toggle");
    $("#modalTitulo").text("Editar categoría: " + data["nombre"]);
    $("#categoriaEditarNombre").val(data["nombre"]);
    $("#categoriaEditarId").val(data["id_categoria"]);
    $("#categoriaEditarDescripcion").val(data["descripcion"]);
    $("#categoriaEditarActivo")
      .val(data["activo_bool"])
      .change();
  });
  /** actualizar categoria */
  $("#categoriaEditarForma").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
    rules: {
      categoriaEditarNombre: "required",
      categoriaEditarDescripcion: "required",
      categoriaEditarActivo: "required"
    },
    messages: {
      categoriaEditarNombre: "Es obligatorio asignar un nombre",
      categoriaEditarDescripcion: "La descripción es obligatoria",
      categoriaEditarActivo: "Este campo es obligatorio!"
    },
    submitHandler: function(form) {
      var dataString = $("#categoriaEditarForma").serialize();
      $("#modalEditar").modal("toggle");
      $.ajax({
        type: "POST",
        url: "work/php/inventario/actualiza/categoria_actualizar.php",
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
                      "work/php/inventario/vistas/categoria_altas.php"
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
                      "work/php/inventario/vistas/categoria_altas.php"
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
  $("#categoriaNombre").focus();
  $("#categoriaForma").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
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
    submitHandler: function(form) {
      var dataString = $("#categoriaForma").serialize();
      $.ajax({
        type: "POST",
        url: "work/php/inventario/insertar/categoria_insertar.php",
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
                      "work/php/inventario/vistas/categoria_altas.php"
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
                      "work/php/inventario/vistas/categoria_altas.php"
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
});
