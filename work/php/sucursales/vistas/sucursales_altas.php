<div class="page-title">
   <div class="title_left">
      <h3>Agregar una nueva sucursal</h3>
   </div>
</div>
<div class="clearfix"></div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2>Datos de la sucursal</h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <div class="panel-body">
               <form class="form-material" id="sucursalForma" >
                  <div class="col-md-3 col-xs-12">
                     <div class="form-group">
                        <label for="sucursalNombre">Nombre de la sucursal</label>
                        <input type="text" class="form-control" name="sucursalNombre" id="sucursalNombre" >
                     </div>
                  </div>
                  <div class="col-md-9 col-xs-12">
                     <div class="form-group">
                        <label for="lastName">Dirección</label>
                        <input type="text" class="form-control" name="sucursalDireccion" >               
                     </div>
                  </div>
                  <div class="col-md-4 col-xs-12">
                     <div class="form-group">
                        <label for="sucursalTelefono">Teléfono</label>
                        <input type="text" class="form-control" name="sucursalTelefono" >
                     </div>
                  </div>                  
                  <div class="col-md-4 col-xs-12">
                     <div class="form-group">
                        <label for="sucursalCiudad">Ciudad</label>               
                        <select class="form-control" id="sucursalCiudad" name="sucursalCiudad" >
                           <option value="">Selecione una ciudad</option>
                        </select>
                     </div>
                  </div>
                  <div class="col-md-4 col-xs-12">
                     <div class="form-group">
                        <label for="sucursalActivo" >Activar</label>               
                        <select class="form-control" id="sucursalActivo" name="sucursalActivo" >
                           <option value="">Seleccione una opción</option>
                        </select>
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
<script src="work/js/sucursales/agregar_sucursal.js"></script>