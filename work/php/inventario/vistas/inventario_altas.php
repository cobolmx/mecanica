<div class="page-title">
   <div class="title_left">
      <h3>Agregar un artículo</h3>
   </div>
</div>
<div class="clearfix"></div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2>Información del artículo</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <div class="panel-body">
               <form class="form-horizontal form-label-left" id="inventarioForma" >
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="inventarioCategoria">Categoría</label>
                        <select class="form-control" id="inventarioCategoria" name="inventarioCategoria">
                           <option value="">Seleccione una categoría</option>
                        </select>
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="inventarioMarca">Marca</label>
                        <select class="form-control" id="inventarioMarca" name="inventarioMarca">
                           <option value="">Seleccione una marca</option>
                        </select>
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="inventarioModelo">Modelo</label>
                        <select class="form-control" id="inventarioModelo" name="inventarioModelo">
                           <option value="">Seleccione una modelo</option>
                        </select>
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="inventarioSerie">Número de serie</label>
                        <input type="text" class="form-control" name="inventarioSerie" id="inventarioSerie" style="text-transform:uppercase">
                     </div>
                  </div>
                  <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="inventariolActivo">Activar</label>
                     <select class="form-control" id="inventarioActivo" name="inventarioActivo">
                        <option value="">Seleccione una opción</option>
                        <option value="1">Sí</option>
                        <option value="0">No</option>
                     </select>
                  </div>
               </div>
                  <div class="col-md-12 col-xs-12">
                     <div class="form-group">
                        <label for="inventarioComentarios">Comentarios</label>
                        <textarea class="form-control" name="inventarioComentarios" rows="4"></textarea>
                     </div>
                  </div>
                  <div class="col-xs-12">
                     <button class="btn btn-info pull-right" type="submit">
                     <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                     </span> Agregar articulo
                     </button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script src="work/js/inventario/inventario_agregar.js"></script>