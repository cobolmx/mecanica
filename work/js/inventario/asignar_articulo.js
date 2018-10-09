$(document).ready(function () {
  $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

  $("#searchInfo").focus();
  /**
   * TYPEHEAD SEARCH
   */
  $("#search").typeahead({
    source: function (query, result) {
      $.ajax({
        url: "work/php/empleados/obtener/busqueda_empleado.php",
        method: "POST",
        data: {
          query: query
        },
        dataType: "json",
        success: function (data) {
          result(
            $.map(data, function (item) {
              $("#searchInfo").val(data.numero_empleado);
              return item;
            })
          );
        }
      });
    }
  });
  /**END */
  /** carga informacion del empleado en conjunto de sus articulos asignados */
  $("#searchForm").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
    rules: {
      search: {
        required: true
      }
    },
    errorPlacement: function () {
      return false;
    },
    submitHandler: function (form) {
      var dataString = $("#searchForm").serialize();
      $.ajax({
        type: "POST",
        url: "work/php/empleados/obtener/obtener_empleado.php",
        data: dataString,
        dataType: "json",
        success: function (result) {
          console.log([result]);
          $("#empleadoNUmeroEmpleado").val("");
          $("#empleadoNombre").val("");
          $("#empleadoPaterno").val("");
          $("#empleadoMaterno").val("");
          $("#empleadoCorreo").val("");
          $("#empleadoRfc").val("");
          $("#empleadoNss").val("");
          $("#empleadoCorreoOriginal").val("");
          $("#empleadoRfcOriginal").val("");
          $("#empleadoNssOriginal").val("");
          $("#empleadoCiudad").val("").change();
          $("#empleadoTelefonoCasa").val("");
          $("#empleadoTelefonoCelular").val("");
          $("#empleadoTelefonoEmergencia").val("");
          $("#empleadoDomicilio").val("");
          $("#empleadoFechaIngreso").val("");
          $("#empleadoRol").val("").change();
          $("#empleadoActivar").val("").change();
          $("#empleadoComentarios").val("");
          $("#empleadoDomicilio").val("");
          $("#empleadoFechaFinContrato").val("");
          switch (result["data"].status) {
            case "success":
              swal({
                title: "Mensaje de Mecanica:  ",
                text: result["data"].message,
                icon: "success",
                closeOnClickOutside: false,
                buttons: {
                  Continuar: true
                }
              }).then(value => {
                switch (value) {
                  case "Continuar":
                    var listadoDocumentos;
                    $("#empleadoNombreCompleto").text(
                      "Información de: " + result["data"].nombre_completo
                    );
                    $("#empleadoNumeroEmpleado").val(
                      result["data"].numero_empleado
                    );
                    $("#empleadoNombre").val(result["data"].nombre);
                    $("#empleadoPaterno").val(result["data"].paterno);
                    $("#empleadoMaterno").val(result["data"].materno);
                    $("#empleadoCorreo").val(result["data"].correo_electronico);
                    $("#empleadoRfc").val(result["data"].rfc);
                    $("#empleadoNss").val(result["data"].nss);
                    $("#empleadoCorreoOriginal").val(
                      result["data"].correo_electronico
                    );
                    $("#empleadoRfcOriginal").val(result["data"].rfc);
                    $("#empleadoNssOriginal").val(result["data"].nss);
                    $("#empleadoTelefonoCasa").val(
                      result["data"].telefono_casa
                    );
                    $("#empleadoTelefonoCelular").val(
                      result["data"].telefono_celular
                    );
                    $("#empleadoTelefonoEmergencia").val(
                      result["data"].telefono_emergencia
                    );
                    $("#empleadoFechaIngreso").val(
                      result["data"].fecha_ingreso
                    );
                    $("#empleadoCiudad")
                      .val(result["data"].ciudad)
                      .change();
                    $("#empleadoDomicilio").val(result["data"].domicilio);
                    /** delay para cargar el chainded select */
                    setTimeout(function () {
                      $("#empleadoSucursal")
                        .val(result["data"].sucursal)
                        .change();
                    }, 100);
                    $("#empleadoRol")
                      .val(result["data"].tipo_usuario)
                      .change();
                    $("#empleadoActivo")
                      .val(result["data"].activo)
                      .change();
                    $("#empleadoComentarios").val(result["data"].comentarios);
                    $("#empleadoFechaFinContrato").val(
                      result["data"].fecha_expiracion
                    );
                    $("#btnActualiza").prop("disabled", false);
                    if (result["data"].path_antecedentes != "") {
                      $("#verPdfAntecedentes").prop("disabled", false);
                      $("#verPdfAntecedentes")
                        .off("click")
                        .click(function (e) {
                          window.open(
                            result["data"].path_antecedentes,
                            "_blank"
                          );
                          e.preventDefault();
                        });
                    }
                    if (result["data"].path_antecedentes != "") {
                      $("#verPdfAntidoping").prop("disabled", false);
                      $("#verPdfAntidoping")
                        .off("click")
                        .click(function (e) {
                          window.open(result["data"].path_antidoping, "_blank");
                          e.preventDefault();
                        });
                    }
                    break;
                }
              });
              break;
            case "warning":
              swal({
                title: "Mensaje de Mecanica:  ",
                text: result["data"].message,
                icon: "warning",
                closeOnClickOutside: false,
                buttons: {
                  Continuar: true
                }
              }).then(value => {
                switch (value) {
                  case "Continuar":
                    $("#searchInfo").val("");
                    $("#searchInfo").focus();
                    break;
                }
              });
              break;
            case "error":
              swal({
                title: "Mensaje de Mecanica:  ",
                text: result["data"].message,
                icon: "error",
                closeOnClickOutside: false,
                buttons: {
                  Continuar: true
                }
              }).then(value => {
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

});