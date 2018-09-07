<?php
require("../../../../config-db/class.db.local.php");
$database = new DB();
$query = "SELECT nombre, descripcion, CASE WHEN activo = 1 THEN 'Sí' ELSE 'No' END as activo, fecha_registro
          FROM articulos_categoria ORDER BY fecha_registro DESC";

$results = $database->get_results($query);
$number = $database->num_rows($query);
if ($number >= 1) {
    foreach ($results as $row) {
        $data['data'][] = array(
            'nombre' => $row['nombre'],
            'descripcion' => $row['descripcion'],
            'activo' => $row['activo'],
            'fecha_registro' => $row['fecha_registro']
        );
    }
    echo json_encode($data);
} else {
    $data['data'] = array(
        'nombre' => '',
        'descripcion' => '',
        'activo' => '',
        'fecha_registro' => ''
    );
    echo json_encode($data);
}
?>