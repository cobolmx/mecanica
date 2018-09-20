<div class="page-title">
   <div class="title_left">
      <h3>Agregar marca</h3>
   </div>
</div>
<div class="clearfix"></div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2>Información de la marca</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <div class="panel-body">
               <form class="form-horizontal form-label-left" id="marcaForma" >
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="marcaCategoria">Categoría</label>
                        <select class="form-control" id="marcaCategoria" name="marcaCategoria">
                           <option value="">Seleccione una categoría</option>
                        </select>
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="marcaNombre">Nombre</label>
                        <input type="text" class="form-control" name="marcaNombre" id="marcaNombre">
                     </div>
                  </div>
                  <div class="col-md-6 col-xs-12">
                     <div class="form-group">
                        <label for="marcaDescripcion">Descripción</label>
                        <input type="text" class="form-control" name="marcaDescripcion" id="marcaDescripcion">
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="marcaActivo">Activar</label>
                        <select class="form-control" id="marcaActivo" name="marcaActivo">
                           <option value="">Seleccione una opción</option>
                           <option value="1">Sí</option>
                           <option value="0">No</option>
                        </select>
                     </div>
                  </div>
                  <div class="col-xs-12">
                     <button class="btn btn-info pull-right" type="submit">
                     <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                     </span> Agregar marca
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
            <h2>Listado de marcas</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <div class="panel-body table-responsive">
               <table class="table table-condensed " id="tablaListadoMarcas">
                  <thead>
                     <tr>
                        <th>Categoria</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Activo</th>
                        <th>Fecha de registro</th>
                        <th>Acción</th>
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
            <form class="form-horizontal form-label-left" id="marcaEditarForma" >
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="marcaEditarCategoria">Categoría</label>
                     <select class="form-control" id="marcaEditarCategoria" name="marcaEditarCategoria">
                        <option value="">Seleccione una categoría</option>
                     </select>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="marcaEditarNombre">Nombre</label>
                     <input type="text" class="form-control" name="marcaEditarNombre" id="marcaEditarNombre">
                  </div>
               </div>
               <div class="col-md-6 col-xs-12">
                  <div class="form-group">
                     <label for="marcaEditarDescripcion">Descripción</label>
                     <input type="text" class="form-control" name="marcaEditarDescripcion" id="marcaEditarDescripcion">
                     <input type="hidden" class="form-control" name="marcaEditarId" id="marcaEditarId">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="marcaActivo">Activo</label>
                     <select class="form-control" id="marcaEditarActivo" name="marcaEditarActivo">
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
            <button type="submit" class="btn btn-info" form='marcaEditarForma'><i class="fa fa-check" aria-hidden="true"></i> Aplicar cambios</button>
         </div>
      </div>
   </div>
</div>
<!-- end modal -->
<script src="work/js/inventario/marca_agregar.js"></script>