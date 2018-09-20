<?php
require "../../../../config-db/class.db.local.php";
require_once '../../funciones/funciones.php';

$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$update = [
    'id_categoria' => $_POST['marcaEditarCategoria'],
    'nombre' => $_POST['marcaEditarNombre'],
    'descripcion' => $_POST['marcaEditarDescripcion'],
    'activo' => $_POST['marcaEditarActivo']
];
$where_clause = array(
    'id' => $_POST['marcaEditarId'],
);
$updated = $database->update('articulos_marca', $update, $where_clause, 1);

if ($updated == '1') {
    $evento = $_SESSION['nombre_empleado'] . ' acabas de actualizar una marca';
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Actualizar marca', obtener_ip());
    $message = $_SESSION['nombre_empleado'] . ' acabas de actualizar una marca';
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