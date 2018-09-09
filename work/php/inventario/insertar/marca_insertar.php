<?php
require("../../../../config-db/class.db.local.php");
require("../../funciones/funciones.php");
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$data_insert = array(
    'id_categoria' => $_POST['marcaCategoria'],
    'nombre' => $_POST['marcaNombre'],
    'descripcion' => $_POST['marcaDescripcion'],
    'activo' => $_POST['marcaActivo'],    
    'fecha_registro' => Date('Y-m-d H:i:s')
);
$add_query   = $database->insert('articulos_marca', $data_insert);

if ($add_query) {
    $evento = 'Se agrego el marca: '.$_POST['marcaNombre'].' por el usuario: '.$_SESSION['nombre_empleado'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'agregar-marca', obtener_ip());
    $message      = 'Se agrego satisfactoriamente la siguiente marca: ' . $_POST['marcaNombre'];
    $data['data'] = array(
        'status' => 'success',
        'message' => $message
    );
    // $message      = 'Your SCRM account has been created with the following username: ' . $username . ' and the following password: ' . $unencrypted_password . '
    // at the following link http://scrm.solucenterint.com.  Passwords are case sensitive.';
    // send_email_notification($email, $name . ' ' . $last_name . ' ' . $maiden_last_name, 'user-create', $message, $_SESSION['email'], $session_full_name);
    echo json_encode($data);
    
} else {
    $evento = 'Ocurrio un error al agregar la marca: '.$_POST['marcaNombre'].' por el usuario: '.$_SESSION['nombre_empleado'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'agregar-marca-error', obtener_ip());
    $message      = 'Ocurrio un error al agregar la marca: ' . $_POST['marcaNombre'] . 'Favor de notificar al administrador del sistema.';
    $data['data'] = array(
        'status' => 'error',
        'message' => $message
    );
    echo json_encode($data);
}
?>
