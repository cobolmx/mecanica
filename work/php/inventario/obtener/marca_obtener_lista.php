<?php
require("../../../../config-db/class.db.local.php");
$database = new DB();
$query = "SELECT b.id, b.nombre, b.descripcion, b.fecha_registro, (SELECT a.nombre FROM articulos_categoria a WHERE a.id = b.id_categoria) AS categoria,
          CASE WHEN b.activo =1 THEN 'Sí' ELSE 'No' END AS activo, activo as activo_bool, b.id_categoria
          FROM articulos_marca b ";

$results = $database->get_results($query);
$number = $database->num_rows($query);
if ($number >= 1) {
    foreach ($results as $row) {
        $data['data'][] = array(
            'categoria' => $row['categoria'],
            'nombre' => $row['nombre'],
            'descripcion' => $row['descripcion'],
            'activo' => $row['activo'],
            'fecha_registro' => $row['fecha_registro'],
            'activo_bool' => $row['activo_bool'],
            'id_marca' => $row['id'],
            'id_categoria' => $row['id_categoria']
        );
    }
    echo json_encode($data);
} else {
    $data['data'] = array(
        'categoria' => '',
        'nombre' => '',
        'descripcion' => '',
        'activo' => '',
        'fecha_registro' => '',
        'activo_bool' => '',
        'id_marca' => '',
        'id_catgoria' => ''
    );
    echo json_encode($data);
}
?>