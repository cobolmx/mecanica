<?php
require("../../../../config-db/class.db.local.php");
require("../../funciones/funciones.php");
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$data_insert = array(
    'nombre' => $_POST['categoriaNombre'],
    'descripcion' => $_POST['categoriaDescripcion'],
    'activo' => $_POST['categoriaActivo'],    
    'fecha_registro' => Date('Y-m-d H:i:s')
);
$add_query   = $database->insert('articulos_categoria', $data_insert);

if ($add_query) {
    $evento = 'agregar-categoria';
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'agregar-categoria', obtener_ip());
    $message      = 'Se agrego satisfactoriamente la siguiente categoría: ' . $_POST['categoriaNombre'];
    $data['data'] = array(
        'status' => 'success',
        'message' => $message
    );
    // $message      = 'Your SCRM account has been created with the following username: ' . $username . ' and the following password: ' . $unencrypted_password . '
    // at the following link http://scrm.solucenterint.com.  Passwords are case sensitive.';
    // send_email_notification($email, $name . ' ' . $last_name . ' ' . $maiden_last_name, 'user-create', $message, $_SESSION['email'], $session_full_name);
    echo json_encode($data);
    
} else {
    $evento = 'agregar-categoria-error';
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'agregar-categoria-error', obtener_ip());
    $message      = 'Ocurrio un error al agregar la categoría: ' . $_POST['categoriaNombre'] . 'Favor de notificar al administrador del sistema.';
    $data['data'] = array(
        'status' => 'error',
        'message' => $message
    );
    echo json_encode($data);
}
?>
