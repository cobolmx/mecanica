<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
$query    = "SELECT nombre_ciudad FROM ciudades WHERE activo = 1";
$results  = $database->get_results($query);
$data     = '';
foreach ($results as $row) {
    $data .= '<option value="' . $row['nombre_ciudad'] . '">' . $row['nombre_ciudad'] . '</option>';
}
echo $data;
?>