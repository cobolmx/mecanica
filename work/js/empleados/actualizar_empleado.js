$(document).ready(function() {
  $(document)
    .ajaxStart($.blockUI)
    .ajaxStop($.unblockUI);
  $("#btnActualiza").prop("disabled", true);
  $("#verPdfAntecedentes,#verPdfAntidoping").prop("disabled", true);
  /**obtenemos el listado de las ciudades */
  $.get("work/php/sucursales/obtener/obtener_ciudades.php", function(data) {
    $("#empleadoCiudad").append(data);
  });
  $.get("work/php/empleados/obtener/obtener_rol.php", function(data) {
    $("#empleadoRol").append(data);
  });
  $("#empleadoCiudad").on("change", function() {
    $("#empleadoSucursal")
      .find("option")
      .remove()
      .end()
      .append('<option value="">Selecione una sucursal</option>');
    $.get(
      "work/php/empleados/obtener/obtener_sucursal.php",
      { ciudad: this.value },
      function(data) {
        $("#empleadoSucursal").append(data);
      }
    );
  });
  /**
   * TYPEHEAD SEARCH
   */
  $("#search").typeahead({
    source: function(query, result) {
      $.ajax({
        url: "work/php/empleados/obtener/demo_search.php",
        method: "POST",
        data: { query: query },
        dataType: "json",
        success: function(data) {
          result(
            $.map(data, function(item) {
              $("#searchInfo").val(data.numero_empleado);
              return item;
            })
          );
        }
      });
    }
  });
  /**END */
  /**mascaras para los numero de telefono y seguro social */
  $(".mascara-telefono").inputmask("(999) 999 9999");
  $("#empleadoNss").inputmask("NSS:99-99-99-9999-9");
  $("#empleadoRfc").inputmask("aaaa-999999-***");

  $(document)
    .ajaxStart($.blockUI)
    .ajaxStop($.unblockUI);

  $("#searchForm").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
    rules: {
      search: {
        required: true
      }
    },
    errorPlacement: function() {
      return false;
    },
    submitHandler: function(form) {
      var dataString = $("#searchForm").serialize();
      $.ajax({
        type: "POST",
        url: "work/php/empleados/obtener/obtener_empleado.php",
        data: dataString,
        dataType: "json",
        success: function(result) {
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
          $("#empleadoCiudad")
            .val("")
            .change();
          $("#empleadoTelefonoCasa").val("");
          $("#empleadoTelefonoCelular").val("");
          $("#empleadoTelefonoEmergencia").val("");
          $("#empleadoDomicilio").val("");
          $("#empleadoFechaIngreso").val("");
          $("#empleadoRol")
            .val("")
            .change();
          $("#empleadoActivar")
            .val("")
            .change();
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
                    setTimeout(function() {
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
                        .click(function(e) {
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
                        .click(function(e) {
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

  /**Check for user login */
  $("#empleadoForma").validate({
    debug: false,
    errorClass: "text-danger parsley-error",
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
      empleadoPassword2: {
        minlength: 6,
        equalTo: "#empleadoPassword"
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
      empleadoPassword2: {
        minlength: "La contraseña debe de ser al menos de 6 caracteres.",
        equalTo: "Las contraseñas no coinciden."
      }
    },
    submitHandler: function(form) {
      // var dataString = $('#empleadoForma').serialize();
      var formData = new FormData($("#empleadoForma")[0]);
      $.ajax({
        type: "POST",
        url: "work/php/empleados/actualiza/actualiza_empleado.php",
        data: formData,
        dataType: "json",
        contentType: false,
        processData: false,
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
                      "work/php/empleados/vistas/empleados_modificaciones.php"
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
                      "work/php/empleados/vistas/empleados_modificaciones.php"
                    );
                    $("#searchInfo").focus();
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
