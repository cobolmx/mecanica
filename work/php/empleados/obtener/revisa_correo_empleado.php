<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
$number = $database->num_rows("SELECT correo_electronico FROM empleados WHERE correo_electronico ='" . $_POST['empleadoCorreo'] . "'");
if ($number == 0) {
    $resultado = 'false';
} else {
    $resultado = 'true';
}
$data = array(
    'status' => $resultado,
    'valid' => $resultado,
    'number' => $number
);
echo json_encode($data);
?>