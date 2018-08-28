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
            <div class="panel-body">
               <form class="form-horizontal form-label-left" id="sucursalForma" >
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoNombre">Nombre</label>
                        <input type="text" class="form-control" name="empleadoNombre" id="empleadoNombre">
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoPaterno">Apellido paterno</label>
                        <input type="text" class="form-control" name="empleadoPaterno" >               
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoMaterno">Apellido materno</label>
                        <input type="text" class="form-control" name="empleadoMaterno" >
                     </div>
                  </div>                  
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoCorreo">Correo electrónico</label>
                        <input type="email" class="form-control" name="empleadoCorreo" >
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoTelefonoCasa">Teléfono casa</label>
                        <input type="text" class="form-control" name="empleadoTelefonoCasa" >
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoCelular">Teléfono celular</label>
                        <input type="text" class="form-control" name="empleadoTelefonoCelular" >
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoTelefonoEmergencia">Teléfono de emergencia</label>
                        <input type="text" class="form-control" name="empleadoTelefonoEmergencia" >
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoTelefonoEmergencia">Teléfono de emergencia</label>
                        <input type="text" class="form-control" name="empleadoTelefonoEmergencia" >
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoRfc">RFC</label>
                        <input type="text" class="form-control" name="empleadoRfc" >
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoNumeroSeguroSocial">Número de seguro social</label>
                        <input type="text" class="form-control" name="empleadoNumeroSeguroSocial" >
                     </div>
                  </div>                  
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="sucursalActivo" >Activar</label>               
                        <select class="form-control" id="sucursalActivo" name="sucursalActivo" >
                           <option value="">Seleccione una opción</option>
                           <option value="1">Sí</option>
                           <option value="0">No</option>
                        </select>
                     </div>
                  </div>    
                  <div class="col-md-12 col-xs-12">
                     <div class="form-group">
                        <label for="empleadoCartaAntecedentesPenales">Carta de antecedentes penales</label>
                        <input type="file" class="form-control" name="empleadoCartaAntecedentesPenales" id="empleadoCartaAntecedentesPenales">
                     </div>
                  </div>
                  <div class="col-md-12 col-xs-12">
                     <div class="form-group">
                        <label for="sucursalComentarios">Descripción</label>
                        <textarea class="form-control" name="sucursalComentarios"  rows="4" ></textarea>
                     </div>
                  </div>              
                  <div class="col-xs-12">
                     <button class="btn btn-info pull-right" type="submit">
                     <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                     </span> Agregar sucursal
                     </button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script src="work/js/empleados/agregar_empleado.js"></script>