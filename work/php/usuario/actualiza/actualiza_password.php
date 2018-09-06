<?php
require "../../../../config-db/class.db.local.php";
require_once '../../funciones/funciones.php';

$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$password = $_POST['usuarioPassword2'];
list($encrypted_password, $salt) = encriptar_password($password);
$update = [
    'password' => $encrypted_password,
    'salt' => $salt,
];
$where_clause = array(
    'CONCAT(identificador,id)' => $_SESSION['numero_empleado']
);
$updated = $database->update('empleados', $update, $where_clause, 1);

if ($updated == '1') {
    $evento = $_SESSION['nombre_empleado'] . ' acabas de actualizar tu contraseña';
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Actualizar contraseña', obtener_ip());
    $message = $_SESSION['nombre_empleado'] . ' acabas de actualizar tu contraseña';
    $data['data'] = array(
        'status' => 'success',
        'message' => $message        
    );
    echo json_encode($data);
} else {
    $data['data'] = array(
        'status' => 'error',
        'message' => 'Ocurrio un error al actualizar: ' . $updated,
    );
    echo json_encode($data);    
}
