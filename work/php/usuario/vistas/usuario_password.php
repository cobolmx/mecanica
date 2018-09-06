<?php 
require("../../../../config-db/class.db.local.php");
require("../../funciones/funciones.php");
?>
<div class="page-title">
   <div class="title_left">
      <h3>Cambiar contaseña</h3>
   </div>
</div>
<div class="clearfix"></div>
<div class="row">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
         <div class="x_title">
            <h2>Cambiar contaseña para: <?php echo $_SESSION['nombre_empleado'];?></h2>
            <div class="clearfix"></div>
         </div>
         <div class="x_content">
            <div class="panel-body">
               <form class="form-horizontal form-label-left" id="usuarioPasswordForma">
                  <div class="col-md-4 col-xs-12">
                     <div class="form-group">
                        <label for="usuarioPassword">Contraseña</label>
                        <input type="password" class="form-control" name="usuarioPassword" id="usuarioPasswordx">
                     </div>
                  </div>
                  <div class="col-md-4 col-xs-12">
                     <div class="form-group">
                        <label for="usuarioPassword2">Repetir contraseña</label>
                        <input type="password" class="form-control" name="usuarioPassword2">
                     </div>
                  </div>
                  <div class="col-md-4 col-xs-12">
                     <label for="boton">&nbsp;</label>
                     <button class="btn btn-info btn-block" type="submit"><i class="fa fa-check" aria-hidden="true"></i> Cambiar contraseña</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script src="work/js/usuario/usuario_password.js"></script>