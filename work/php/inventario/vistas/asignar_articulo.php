<div class="page-title">
   <div class="title_left">
      <h3>Asignar articulo a empleado</h3>
   </div>
   <div class="title_right">
      <div class="col-md-8 col-sm-8 col-xs-12 form-group pull-right top_search">
         <form  class="form-horizontal form-label-left" id="searchForm" >
            <div class="input-group">
               <input type="text" class="form-control" placeholder="Buscar empleado" name="searchInfo" id="searchInfo">
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
         <!--start right-->
         <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
            <h3>Empleado</h3>
            <h4>nombre_empleado</h4>
         </div>
         <!--end  right-->
         <div class="col-md-9 col-sm-9 col-xs-12">
            <h3>Asignar artículo</h3>
            <form class="form-horizontal form-label-left" id="asignaForma" >
               <div class="col-md-4 col-xs-12">
                  <div class="form-group">
                     <label for="modeloMarca">Categoría</label>
                     <select class="form-control" id="asignaCategoria" name="asignaCategoria">
                        <option value="">Seleccione una categoría</option>
                     </select>
                  </div>
               </div>
               <div class="col-md-4 col-xs-12">
                  <div class="form-group">
                     <label for="modeloNombre">Nombre</label>
                     <input type="text" class="form-control" name="modeloNombre" id="modeloNombre">
                  </div>
               </div>
               <div class="col-md-12 col-xs-12">
                  <div class="form-group">
                     <label for="modeloDescripcion">Descripción</label>
                     <input type="text" class="form-control" name="modeloDescripcion" id="modeloDescripcion">
                  </div>
               </div>
               <!-- <div class="col-md-3 col-xs-12">
                  <div class="form-group">
                     <label for="categorialActivo">Activar</label>
                     <select class="form-control" id="modeloActivo" name="modeloActivo">
                        <option value="">Seleccione una opción</option>
                        <option value="1">Sí</option>
                        <option value="0">No</option>
                     </select>
                  </div>
                  </div> -->
               <div class="col-xs-12">
                  <button class="btn btn-info pull-right" type="submit">
                  <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                  </span> Agregar modelo
                  </button>
               </div>
            </form>
            </form>
         </div>
      </div>
   </div>
</div>
<script src="work/js/inventario/asignar_articulo.js"></script>