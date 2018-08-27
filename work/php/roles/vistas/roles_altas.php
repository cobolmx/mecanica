<div class="page-title">
   <div class="title_left">
      <h3>Agregar un nuevo rol</h3>
   </div>
</div>
<div class="clearfix"></div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2>Información del rol</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <div class="panel-body">
               <form class="form-horizontal form-label-left" id="rolForma" >
                  <div class="col-md-4 col-xs-12">
                     <div class="form-group">
                        <label for="rolNombre">Nombre</label>
                        <input type="text" class="form-control" name="rolNombre" id="rolNombre" >
                     </div>
                  </div>
                  <div class="col-md-4 col-xs-12">
                     <div class="form-group">
                        <label for="rolActivo" >Activar</label>               
                        <select class="form-control" id="rolActivo" name="rolActivo" >
                           <option value="">Seleccione una opción</option>
                           <option value="1">Sí</option>
                           <option value="0">No</option>
                        </select>
                     </div>
                  </div> 
                  <div class="col-md-12 col-xs-12">
                     <div class="form-group">
                        <label for="rolDescripcion">Descripción</label>
                        <textarea class="form-control" name="rolDescripcion"  rows="4" ></textarea>
                     </div>
                  </div>                          
                  <div class="col-xs-12">
                     <button class="btn btn-info pull-right" type="submit">
                     <span class="btn-label"><i class="fa fa-check" aria-hidden="true"></i>
                     </span> Agregar Rol
                     </button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script src="work/js/roles/agregar_rol.js"></script>