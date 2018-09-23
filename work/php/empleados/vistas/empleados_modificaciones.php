<div class="page-title">
   <div class="title_left">
      <h3>Modificar información de empleado</h3>
   </div>
   <div class="title_right">
      <div class="col-md-8 col-sm-8 col-xs-12 form-group pull-right top_search">
      <form id="form-user_v1" name="form-user_v1">
      <div class="typeahead__container">
        <div class="typeahead__field">
            <div class="typeahead__query">
                <input class="js-typeahead" name="user_v1[query]" type="search" placeholder="Search" autocomplete="off">
            </div>
            <div class="typeahead__button">
                <button class="btn btn-success" type="submit">
                    <!-- <i class="typeahead__search-icon"></i> -->
                    <span class="btn-label"><i class="fa fa-search" aria-hidden="true"></i>
               </span>
                </button>
            </div>
        </div>
    </div>             
     
</form>
        <!-- <form  class="form-horizontal form-label-left" id="searchForm" > -->
        
            <!-- <div class="input-group">
               <input type="text" class="form-control" placeholder="Buscar por NSS, RFC..." name="searchInfo" id="searchInfo">
               <span class="input-group-btn">
               <button class="btn btn-success" type="submit">
               <span class="btn-label"><i class="fa fa-search" aria-hidden="true"></i>
               </span>
               </button>
               </span>
               </div> -->
         <!-- </form> -->
      </div>
      <!-- </form> -->
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
                     <input type="text" class="form-control" id="empleadoNumeroEmpleado" name="empleadoNumeroEmpleado" READONLY>
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
                     <input type="text" class="form-control" name="empleadoPaterno" id="empleadoPaterno">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoMaterno">Apellido materno</label>
                     <input type="text" class="form-control" name="empleadoMaterno" id="empleadoMaterno">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoCorreo">Correo electrónico</label>
                     <input type="email" class="form-control" name="empleadoCorreo" id="empleadoCorreo">
                     <input type="hidden" class="form-control" name="empleadoCorreoOriginal" id="empleadoCorreoOriginal">
                  </div>
               </div>
               <div class="col-md-9 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoDomicilio">Domicilio</label>
                     <input type="text" class="form-control" name="empleadoDomicilio" id="empleadoDomicilio">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoRfc">RFC</label>
                     <input type="text" class="form-control" name="empleadoRfc" id="empleadoRfc" style="text-transform:uppercase">
                     <input type="hidden" class="form-control" name="empleadoRfcOriginal" id="empleadoRfcOriginal" style="text-transform:uppercase">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoNumeroSeguroSocial">Número de seguro social</label>
                     <input type="text" class="form-control" name="empleadoNss" id="empleadoNss">
                     <input type="hidden" class="form-control" name="empleadoNssOriginal" id="empleadoNssOriginal">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoFechaIngreso">Fecha de ingreso a laborar</label>
                     <input type="text" class="form-control" id="empleadoFechaIngreso" READONLY>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoFechaFinContrato">Fecha de fin de contrato</label>
                     <input type="text" class="form-control" id="empleadoFechaFinContrato" READONLY>
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
                     <label for="empleadoTelefonoCasa">Teléfono casa</label>
                     <input type="text" class="form-control mascara-telefono" name="empleadoTelefonoCasa" id="empleadoTelefonoCasa">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoCelular">Teléfono celular</label>
                     <input type="text" class="form-control mascara-telefono" name="empleadoTelefonoCelular" id="empleadoTelefonoCelular">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="empleadoTelefonoEmergencia">Teléfono de emergencia</label>
                     <input type="text" class="form-control mascara-telefono" name="empleadoTelefonoEmergencia" id="empleadoTelefonoEmergencia">
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
                     <label for="empleadolActivo">Activo</label>
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
                     <textarea class="form-control" name="empleadoComentarios" rows="4" id="empleadoComentarios"></textarea>
                  </div>
               </div>
               <div class="col-md-12 col-xs-12">
                  <div class="x_panel">
                     <div class="x_title">
                        <h2>Lista de documentos</h2>
                        <div class="clearfix"></div>
                     </div>
                     <div class="x_content table-responsive">
                        <table class="table table-condensed " id="listaDocumentos">
                           <thead>
                              <tr>
                                 <th class="col-md-6">Documento</th>
                                 <th class="col-md-3 text-center">Accion</th>
                                 <th class="col-md-3 text-center">Actualizar documentos</th>
                              </tr>
                           </thead>
                           <tbody id='tablaDocumentos'>
                              <tr>
                                 <td><strong>Carta antecedentes penales</strong></td>
                                 <td><button id="verPdfAntecedentes" class="btn btn-success btn-xs btn-block"><i class="fa fa-eye" aria-hidden="true"></i> Ver documento</button></td>
                                 <td>
                                    <div class="form-group">
                                       <label class="btn-bs-file btn btn-xs btn-warning btn-block">
                                       Subir carta antecedentes
                                       <input type="file" class="form-control" name="empleadoAntecedentes" id="empleadoAntecedentes" accept="application/pdf">
                                       </label>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                                 <td><strong>Carta Antidoping</strong></td>
                                 <td><button id="verPdfAntidoping" class="btn btn-success btn-xs btn-block " ><i class="fa fa-eye" aria-hidden="true"></i> Ver documento</button></td>
                                 <td>
                                    <div class="form-group">
                                       <label class="btn-bs-file btn btn-xs btn-warning btn-block">
                                       Subir carta antidoping
                                       <input type="file" class="form-control" name="empleadoAntidoping" id="empleadoAntidoping" accept="application/pdf">
                                       </label>
                                    </div>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <div class="col-xs-12">
                  <button class="btn btn-info pull-right" type="submit" id="btnActualiza">
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