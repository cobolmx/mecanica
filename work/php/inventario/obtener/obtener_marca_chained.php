<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
$query = "SELECT id, nombre  FROM articulos_marca WHERE activo = 1 AND id_categoria = '" . $_GET['id_categoria'] . "'";
$results = $database->get_results($query);
$data = '';
foreach ($results as $row) {
    $data .= '<option value="' . $row['id'] . '">' . $row['nombre'] . '</option>';
}
echo $data;
?>