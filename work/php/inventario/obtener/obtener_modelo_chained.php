<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
$query = "SELECT id, nombre  FROM articulos_modelo WHERE activo = 1 AND id_marca = '" . $_GET['id_marca'] . "'";
$results = $database->get_results($query);
$data = '';
foreach ($results as $row) {
    $data .= '<option value="' . $row['id'] . '">' . $row['nombre'] . '</option>';
}
echo $data;
?>