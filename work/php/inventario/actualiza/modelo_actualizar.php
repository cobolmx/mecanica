<?php
require "../../../../config-db/class.db.local.php";
require_once '../../funciones/funciones.php';
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}
$update = [
    'id_marca' => $_POST['modeloEditarMarca'],
    'nombre' => $_POST['modeloEditarNombre'],
    'descripcion' => $_POST['modeloEditarDescripcion'],
    'activo' => $_POST['modeloEditarActivo']
];
$where_clause = array(
    'id' => $_POST['modeloEditarId']
);
$updated = $database->update('articulos_modelo', $update, $where_clause, 1);

if ($updated == '1') {
    $evento = $_SESSION['nombre_empleado'] . ' acabas de actualizar un modelo';
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Actualizar modelo', obtener_ip());
    $message = $_SESSION['nombre_empleado'] . ' acabas de actualizar un modelo';
    $data['data'] = array(
        'status' => 'success',
        'message' => $message        
    );
    echo json_encode($data);
} else {
    $data['data'] = array(
        'status' => 'error',
        'message' => 'Ocurrio un error al actualizar: ' . $updated        
    );
    echo json_encode($data);
}
?>