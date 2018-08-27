<?php
require("../../../../config-db/class.db.local.php");
// require_once '../../functions/functions.php';
$database = new DB();

$query = "SELECT nombre_sucursal as nombre , ciudad, direccion, telefono
          FROM sucursales WHERE activo = 1 ORDER BY ciudad";

$results = $database->get_results($query);
$number  = $database->num_rows($query);
if ($number >= 1) {
    foreach ($results as $row) {
        $data['data'][] = array(
            'nombre' => $row['nombre'],
            'ciudad' => $row['ciudad'],
            'direccion' => $row['direccion'],
            'telefono' => $row['telefono']            
        );
    }
    echo json_encode($data);
} else {
    $data['data'] = array(
        'nombre' => "",
        'ciudad' => "",
        'direccion' => "",
        'telefono' => ""
    );
    echo json_encode($data);
}
?>