<?php
require("../../../../config-db/class.db.local.php");
$database = new DB();
$query = "SELECT b.id, b.nombre, b.descripcion, b.fecha_registro, (SELECT a.nombre FROM articulos_marca a WHERE a.id = b.id_marca) AS marca,
          CASE WHEN b.activo =1 THEN 'Sí' ELSE 'No' END AS activo, activo  as activo_bool, b.id_marca
          FROM articulos_modelo b";

$results = $database->get_results($query);
$number = $database->num_rows($query);
if ($number >= 1) {
    foreach ($results as $row) {
        $data['data'][] = array(
            'marca' => $row['marca'],
            'nombre' => $row['nombre'],
            'descripcion' => $row['descripcion'],
            'activo' => $row['activo'],
            'fecha_registro' => $row['fecha_registro'],
            'activo_bool' => $row['activo_bool'],
            'id_modelo' => $row['id'],
            'id_marca' => $row['id_marca']
        );
    }
    echo json_encode($data);
} else {
    $data['data'] = array(
        'marca' => '',
        'nombre' => '',
        'descripcion' => '',
        'activo' => '',
        'fecha_registro' => '',
        'activo_bool' => '',
        'id_modelo' => '',
        'id_marca' => ''
    );
    echo json_encode($data);
}
?>