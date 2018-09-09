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
                        <label for="categpriaNombre">Nombre</label>
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
         <div class="x_content">
            <div class="panel-body table-responsive">
               <table class="table table-condensed table-striped" id="tablaListadoCategoria">
                  <thead>
                     <tr>
                        <th class="col-md-3">Nombre</th>
                        <th class="col-md-6 text-center">Descripcion</th>
                        <th class="col-md-1 text-center">Activo</th>
                        <th class="col-md-2 text-center">Fecha de registro</th>
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
<script src="work/js/inventario/categoria_agregar.js"></script>