<div class="page-title">
   <div class="title_left">
      <h3>Agregar un nuevo empleado</h3>
   </div>
</div>
<div class="clearfix"></div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2>Información del empleado</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <form class="form-horizontal form-label-left" id="empleadoForma">
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoNombre">Nombre</label>
                     <input type="text" class="form-control" name="empleadoNombre" id="empleadoNombre">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoPaterno">Apellido paterno</label>
                     <input type="text" class="form-control" name="empleadoPaterno">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoMaterno">Apellido materno</label>
                     <input type="text" class="form-control" name="empleadoMaterno">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoCorreo">Correo electrónico</label>
                     <input type="email" class="form-control" name="empleadoCorreo" id="empleadoCorreo">
                  </div>
               </div>
               <div class="col-md-9 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoDomicilio">Domicilio</label>
                     <input type="text" class="form-control" name="empleadoDomicilio">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoTelefonoCasa">Teléfono casa</label>
                     <input type="text" class="form-control mascara-telefono" name="empleadoTelefonoCasa">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoCelular">Teléfono celular</label>
                     <input type="text" class="form-control mascara-telefono" name="empleadoTelefonoCelular">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoTelefonoEmergencia">Teléfono de emergencia</label>
                     <input type="text" class="form-control mascara-telefono" name="empleadoTelefonoEmergencia">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoRfc">RFC</label>
                     <input type="text" class="form-control" name="empleadoRfc" id="empleadoRfc" style="text-transform:uppercase">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoNumeroSeguroSocial">Número de seguro social</label>
                     <input type="text" class="form-control" name="empleadoNss" id="empleadoNss">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12 xdisplay_inputx has-feedback daterangepicker_input">
                  <div class="form-group">
                     <label for="empleadoFechaIngreso">Fecha de ingreso a laborar</label>
                     <input type="text" class="form-control has-feedback-left" id="empleadoFechaIngreso" name="empleadoFechaIngreso">
                     <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                     <span id="inputSuccess2Status4" class="sr-only"></span>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoPassword">Contraseña</label>
                     <input type="password" class="form-control" name="empleadoPassword" id="empleadoPassword" >
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoPassword2">Repetir contraseña</label>
                     <input type="password" class="form-control" name="empleadoPassword2">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoRol">Rol del empleado</label>
                     <select class="form-control" id="empleadoRol" name="empleadoRol">
                        <option value="">Selecione un rol</option>
                     </select>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoCiudad">Ciudad</label>
                     <select class="form-control" id="empleadoCiudad" name="empleadoCiudad">
                        <option value="">Selecione una ciudad</option>
                     </select>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoSucursal">Sucursal</label>
                     <select class="form-control" id="empleadoSucursal" name="empleadoSucursal">
                        <option value="">Selecione una sucursal</option>
                     </select>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadolActivo">Activar</label>
                     <select class="form-control" id="empleadoActivo" name="empleadoActivo">
                        <option value="">Seleccione una opción</option>
                        <option value="1">Sí</option>
                        <option value="0">No</option>
                     </select>
                  </div>
               </div>
               <div class="col-md-12 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoComentarios">Comentarios</label>
                     <textarea class="form-control" name="empleadoComentarios" rows="4"></textarea>
                  </div>
               </div>
               <div class="col-md-6 col-xs-12">
                  <div class="form-group">                                                           
                     <label class="btn-bs-file btn btn-sm btn-dark btn-block"> 
                     Seleccionar documento antidoping
                     <input type="file" class="form-control" name="empleadoAntidoping" id="empleadoAntidoping" accept="application/pdf"> 
                     </label>
                  </div>
               </div>
               <div class="col-md-6 col-xs-12">
                  <div class="form-group">                                
                     <label class="btn-bs-file btn btn-sm btn-dark btn-block">
                     <strong>Seleccionar carta antecedentes no penales</strong>
                     <input type="file" class="form-control" name="empleadoAntecedentes" id="empleadoAntecedentes" accept="application/pdf">
                     </label>
                  </div>
               </div>
               <div class="col-xs-12">
                  <button class="btn btn-info pull-right" type="submit">
                  <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                  </span> Agregar empleado
                  </button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<script src="work/js/empleados/agregar_empleado.js"></script>