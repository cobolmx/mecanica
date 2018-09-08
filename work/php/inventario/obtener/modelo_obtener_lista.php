<?php
require("../../../../config-db/class.db.local.php");
$database = new DB();
$query = "SELECT b.nombre, b.descripcion, b.fecha_registro, (SELECT a.nombre FROM articulos_categoria a WHERE a.id = b.id) AS categoria,
          CASE WHEN b.activo =1 THEN 'Sí' ELSE 'No' END AS activo
          FROM articulos_modelo b WHERE b.activo = 1";

$results = $database->get_results($query);
$number = $database->num_rows($query);
if ($number >= 1) {
    foreach ($results as $row) {
        $data['data'][] = array(
            'categoria' => $row['categoria'],
            'nombre' => $row['nombre'],
            'descripcion' => $row['descripcion'],
            'activo' => $row['activo'],
            'fecha_registro' => $row['fecha_registro']
        );
    }
    echo json_encode($data);
} else {
    $data['data'] = array(
        'categoria' => '',
        'nombre' => '',
        'descripcion' => '',
        'activo' => '',
        'fecha_registro' => ''
    );
    echo json_encode($data);
}
?>