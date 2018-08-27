<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$data_insert = array(
    'nombre_sucursal' => $_POST['sucursalNombre'],
    'direccion' => $_POST['sucursalDireccion'],
    'telefono' => $_POST['sucursalTelefono'],
    'ciudad' => $_POST['sucursalCiudad'],
    'activo' => $_POST['sucursalActivo'],
    'fecha_de_registro' => Date('Y-m-d H:i:s')
);
$add_query   = $database->insert('sucursales', $data_insert);

if ($add_query) {    
    $evento  = 'Agregar sucursal';
    registro_bitacora($_SESSION['numeroEmpleado'], $evento, 'Agregar sucursal', obtener_ip());    
    $message      = 'Se creo satisfactoriamente la sucursal: '.$_POST['nombreSucursal'];
    $data['data'] = array(
        'status' => 'success',
        'message' => $message
    );
    // $message      = 'Your SCRM account has been created with the following username: ' . $username . ' and the following password: ' . $unencrypted_password . '
    // at the following link http://scrm.solucenterint.com.  Passwords are case sensitive.';
    // send_email_notification($email, $name . ' ' . $last_name . ' ' . $maiden_last_name, 'user-create', $message, $_SESSION['email'], $session_full_name);
    echo json_encode($data);
    
} else {
    $evento  = 'Error al agregar sucursal';
    registro_bitacora($_SESSION['numeroEmpleado'], $evento, 'Agregar sucursal', obtener_ip());    
    $message      = 'Ocurrio un error al agregar la sucursal: '.$_POST['nombreSucursal']. 'Favor de notificar al administrador del sistema';
    $data['data'] = array(
        'status' => 'error',
        'message' => $message
    );
    echo json_encode($data);
}
?>
