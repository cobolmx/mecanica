$(document).ready(function() {
  
  $("#searchInfo").focus();

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
      empleadoPassword: {
        required: true,
        minlength: 6
      },
      empleadoPassword2: {
        required: true,
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
      empleadoPassword: {
        required: "Este campo es obligatorio!",
        minlength: "La contraseña debe de ser al menos de 6 caracteres.",
        equalTo: "Las contraseñas no coinciden."
      },
      empleadoPassword2: {
        required: "Este campo es obligatorio!",
        minlength: "La contraseña debe de ser al menos de 6 caracteres.",
        equalTo: "Las contraseñas no coinciden."
      }
    },
    submitHandler: function(form) {
      // var dataString = $('#empleadoForma').serialize();
      var formData = new FormData($("#empleadoForma")[0]);
      $.ajax({
        type: "POST",
        url: "work/php/empleados/insertar/agregar_empleado.php",
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
                      "work/php/empleados/vistas/empleados_altas.php"
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
                    // $('#main_area').load("work/php/empleados/vistas/empleados_altas.php");
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
                      "work/php/empleados/vistas/empleados_altas.php"
                    );
                    $("#empleadoNombre").focus();
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
