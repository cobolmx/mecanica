<div class="page-title">
   <div class="title_left">
      <h3>Modificar información de empleado</h3>
   </div>
   <div class="title_right">
      <div class="col-md-8 col-sm-8 col-xs-12 form-group pull-right top_search">
         <form  class="form-horizontal form-label-left" id="searchForm" >
            <div class="input-group">
               <input type="text" class="form-control" placeholder="Buscar por NSS, RFC..." name="searchInfo" id="searchInfo">
               <span class="input-group-btn">
               <button class="btn btn-success" type="submit">
               <span class="btn-label"><i class="fa fa-search" aria-hidden="true"></i>
                  </span>
                   Buscar</button>
               </span>
            </div>
      </div>
      </form>
   </div>
</div>
<div class="clearfix"></div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2 id="empleadoNombreCompleto"></h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <form class="form-horizontal form-label-left" id="empleadoForma">
              <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoNumeroEmpleado">Número de empleado</label>
                     <input type="text" class="form-control" id="empleadoNumeroEmpleado" READONLY>
                  </div>
               </div>
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
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">                     
                     <label for="empleadoCiudad">Ciudad</label>
                     <select class="form-control" id="empleadoCiudad" name="empleadoCiudad" id="empleadoCiudad">
                        <option value="">Selecione una ciudad</option>
                     </select>
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
                     <label for="empleadoFechaIngreso">Fecha de ingreso</label>
                     <input type="text" class="form-control" id="empleadoFechaIngreso">
                  </div>
               </div> 
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="id_label_single"></label>
                     <label for="empleadoRol">Rol del empleado</label>
                     <select class="form-control" id="empleadoRol" name="empleadoRol">
                        <option value="">Selecione un rol</option>
                     </select>
                  </div>
               </div>             
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoPassword">Contraseña</label>
                     <input type="text" class="form-control" name="empleadoPassword" id="empleadoPassword" >
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoPassword2">Repetir contraseña</label>
                     <input type="text" class="form-control" name="empleadoPassword2">
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
               <div class="col-xs-12">
                  <button class="btn btn-info pull-right" type="submit">
                  <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                  </span> Actualizar empleado
                  </button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<script src="work/js/empleados/actualizar_empleado.js"></script>