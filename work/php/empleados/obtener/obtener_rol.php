<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
$query    = "SELECT nombre FROM roles WHERE activo = 1";
$results  = $database->get_results($query);
$data     = '';
foreach ($results as $row) {
    $data .= '<option value="' . $row['nombre'] . '">' . $row['nombre'] . '</option>';
}
echo $data;
?>