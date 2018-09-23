<div class="page-title">
   <div class="title_left">
      <h3>Agregar modelo</h3>
   </div>
</div>
<div class="clearfix"></div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2>Información del modelo</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <div class="panel-body">
               <form class="form-horizontal form-label-left" id="modeloForma" >
               <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="modeloMarca">Marca</label>
                        <select class="form-control" id="modeloMarca" name="modeloMarca">
                           <option value="">Seleccione una marca</option>                           
                        </select>
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="modeloNombre">Nombre</label>
                        <input type="text" class="form-control" name="modeloNombre" id="modeloNombre">
                     </div>
                  </div>
                  <div class="col-md-6 col-xs-12">
                     <div class="form-group">
                        <label for="modeloDescripcion">Descripción</label>
                        <input type="text" class="form-control" name="modeloDescripcion" id="modeloDescripcion">
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="categorialActivo">Activar</label>
                        <select class="form-control" id="modeloActivo" name="modeloActivo">
                           <option value="">Seleccione una opción</option>
                           <option value="1">Sí</option>
                           <option value="0">No</option>
                        </select>
                     </div>
                  </div>
                  <div class="col-xs-12">
                     <button class="btn btn-info pull-right" type="submit">
                     <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                     </span> Agregar modelo
                     </button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2>Listado de modelos</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <div class="panel-body table-responsive">
               <table class="table table-condensed " id="tablaListadoModelos">
                  <thead>
                     <tr>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Descripción</th>
                        <th>Activo</th>
                        <th>Fecha de registro</th>
                        <th>Acciones</th>
                     </tr>
                  </thead>
                  <tbody>                     
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- modal-->
<div class="modal fade " id="modalEditar" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
            </button>
            <h4 class="modal-title" id="modalTitulo"></h4>
         </div>
         <div class="modal-body">
            <form class="form-horizontal form-label-left" id="modeloEditarForma" >
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="modeloEditarMarca">Marca</label>
                     <select class="form-control" id="modeloEditarMarca" name="modeloEditarMarca">
                        <option value="">Seleccione una marca</option>
                     </select>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="modeloEditarNombre">Nombre</label>
                     <input type="text" class="form-control" name="modeloEditarNombre" id="modeloEditarNombre">
                  </div>
               </div>
               <div class="col-md-6 col-xs-12">
                  <div class="form-group">
                     <label for="modeloEditarDescripcion">Descripción</label>
                     <input type="text" class="form-control" name="modeloEditarDescripcion" id="modeloEditarDescripcion">
                     <input type="hidden" class="form-control" name="modeloEditarId" id="modeloEditarId">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="modeloActivo">Activo</label>
                     <select class="form-control" id="modeloEditarActivo" name="modeloEditarActivo">
                        <option value="">Seleccione una opción</option>
                        <option value="1">Sí</option>
                        <option value="0">No</option>
                     </select>
                  </div>
               </div>
            </form>
         </div>
         <div class="modal-footer" >
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-info" form='modeloEditarForma'><i class="fa fa-check" aria-hidden="true"></i> Aplicar cambios</button>
         </div>
      </div>
   </div>
</div>
<!-- end modal -->
<script src="work/js/inventario/modelo_agregar.js"></script>