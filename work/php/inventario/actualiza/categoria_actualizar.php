<?php
require "../../../../config-db/class.db.local.php";
require_once '../../funciones/funciones.php';

$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$update = [
    'nombre' => $_POST['categoriaEditarNombre'],
    'descripcion' => $_POST['categoriaEditarDescripcion'],
    'activo' => $_POST['categoriaEditarActivo']
];
$where_clause = array(
    'id' => $_POST['categoriaEditarId'],
);
// echo '<pre><>'.print_r($where_clause).'</pre>';
$updated = $database->update('articulos_categoria', $update, $where_clause, 1);

if ($updated == '1') {
    $evento = $_SESSION['nombre_empleado'] . ' acabas de actualizar una categoria';
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Actualizar categoria', obtener_ip());
    $message = $_SESSION['nombre_empleado'] . ' acabas de actualizar la categoria';
    $data['data'] = array(
        'status' => 'success',
        'message' => $message,
    );
    echo json_encode($data);
} else {
    $data['data'] = array(
        'status' => 'error',
        'message' => 'Ocurrio un error al actualizar: ' . $updated,
    );
    echo json_encode($data);
}
?>