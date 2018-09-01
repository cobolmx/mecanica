<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
$query    = "SELECT nombre_sucursal FROM sucursales WHERE activo = 1 AND ciudad = '".$_GET['ciudad']."'";
$results  = $database->get_results($query);
$data     = '';
foreach ($results as $row) {
    $data .= '<option value="' . $row['nombre_sucursal'] . '">' . $row['nombre_sucursal'] . '</option>';
}
echo $data;
?>