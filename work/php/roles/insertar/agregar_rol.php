<?php
require("../../../../config-db/class.db.local.php");
require("../../funciones/funciones.php");
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$data_insert = array(
    'nombre' => $_POST['rolNombre'],
    'descripcion' => $_POST['rolDescripcion'],    
    'activo' => $_POST['rolActivo'],
    'fecha_registro' => Date('Y-m-d H:i:s')
);
$add_query   = $database->insert('roles', $data_insert);

if ($add_query) {
    $evento = 'Agrego el rol de '.$_POST['rolNombre'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Agregar rol', obtener_ip());
    $message      = 'Se agrego satisfactoriamente el rol: ' . $_POST['rolNombre'];
    $data['data'] = array(
        'status' => 'success',
        'message' => $message
    );
    // $message      = 'Your SCRM account has been created with the following username: ' . $username . ' and the following password: ' . $unencrypted_password . '
    // at the following link http://scrm.solucenterint.com.  Passwords are case sensitive.';
    // send_email_notification($email, $name . ' ' . $last_name . ' ' . $maiden_last_name, 'user-create', $message, $_SESSION['email'], $session_full_name);
    echo json_encode($data);
    
} else {
    $evento = 'Error al agregar rol: '.$_POST['rolNombre'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Agregar rol', obtener_ip());
    $message      = 'Ocurrio un error al agregar el rol: ' . $_POST['rolNombre'] . 'Favor de notificar al administrador del sistema.';
    $data['data'] = array(
        'status' => 'error',
        'message' => $message
    );
    echo json_encode($data);
}
?>
