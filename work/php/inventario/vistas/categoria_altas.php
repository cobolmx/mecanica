<div class="page-title">
   <div class="title_left">
      <h3>Agregar categoria</h3>
   </div>
</div>
<div class="clearfix"></div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2>Información de la categoria</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <div class="panel-body">
               <form class="form-horizontal form-label-left" id="categoriaForma" >
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="categoriaNombre">Nombre</label>
                        <input type="text" class="form-control" name="categoriaNombre" id="categoriaNombre">
                     </div>
                  </div>
                  <div class="col-md-6 col-xs-12">
                     <div class="form-group">
                        <label for="categoriaDescripcion">Descripción</label>
                        <input type="text" class="form-control" name="categoriaDescripcion" id="categoriaDescripcion">
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="categorialActivo">Activar</label>
                        <select class="form-control" id="categoriaActivo" name="categoriaActivo">
                           <option value="">Seleccione una opción</option>
                           <option value="1">Sí</option>
                           <option value="0">No</option>
                        </select>
                     </div>
                  </div>
                  <div class="col-xs-12">
                     <button class="btn btn-info pull-right" type="submit">
                     <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                     </span> Agregar categoría
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
            <h2>Listado de categorias</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content table-responsive">
            <div class="panel-body">
               <table class="table table-condensed table-striped" id="tablaListadoCategoria">
                  <thead>
                     <tr>
                        <th>Nombre</th>
                        <th>Descripcion</th>
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
         <form class="form-horizontal form-label-left" id="categoriaEditarForma" >
         <div class="modal-body">
            <!-- <form class="form-horizontal form-label-left" id="categoriaEditarForma" > -->
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="categoriaEditarNombre">Nombre</label>
                     <input type="text" class="form-control" name="categoriaEditarNombre" id="categoriaEditarNombre">
                     <input type="hidden" class="form-control" name="categoriaEditarId" id="categoriaEditarId">
                  </div>
               </div>
               <div class="col-md-6 col-xs-12">
                  <div class="form-group">
                     <label for="categoriaEditarDescripcion">Descripción</label>
                     <input type="text" class="form-control" name="categoriaEditarDescripcion" id="categoriaEditarDescripcion">
                  </div>
               </div>
               <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="categorialEditarActivo">Activar</label>
                     <select class="form-control" id="categoriaEditarActivo" name="categoriaEditarActivo">
                        <option value="">Seleccione una opción</option>
                        <option value="1">Sí</option>
                        <option value="0">No</option>
                     </select>
                  </div>
               </div>
               <!-- <div class="col-xs-12">
                  <button class="btn btn-info pull-right" type="submit">
                  <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                  </span> Agregar categoría
                  </button>
                  </div> -->
               <!-- </form> -->
         </div>
         <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
         <button type="submit" class="btn btn-info"><i class="fa fa-check" aria-hidden="true"></i> Aplicar cambios</button>
         </div>
      </div>
      </form>
   </div>
</div>
<!-- end modal -->
<script src="work/js/inventario/categoria_agregar.js"></script>