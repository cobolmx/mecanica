<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$existe_rfc = valida_dato_unico('rfc', $_POST['empleadoRfc']);
if ($existe_rfc == 'existe') {
    $message = 'El RFC: ' . $_POST['empleadoRfc'];
    $data['data'] = array(
        'status' => 'exist',
        'message' => $message,
        'focus' => "empleadoRfc",
    );
    echo json_encode($data);
    die();
}

$existe_nss = valida_dato_unico('nss', $_POST['empleadoNss']);
if ($existe_nss == 'existe') {
    $message = 'El Número de seguro social: ' . $_POST['empleadoRfc'] . ' ya existe';
    $data['data'] = array(
        'status' => 'exist',
        'message' => $message,
        'focus' => "empleadoNss",
    );
    echo json_encode($data);
    die();
}

if (empty($_POST['empleadoTelefonoCasa'])) {
    $telefono_casa = '';
} else {
    $telefono_casa = $_POST['empleadoTelefonoCasa'];
}
if (empty($_POST['empleadoTelefonoCelular'])) {
    $telefono_celular = '';
} else {
    $telefono_celular = $_POST['empleadoTelefonoCelular'];
}
if (empty($_POST['empleadoTelefonoEmergencia'])) {
    $telefono_emergencia = '';
} else {
    $telefono_emergencia = $_POST['empleadoTelefonoCelular'];
}
if (empty($_POST['empleadoComentarios'])) {
    $comentarios = '';
} else {
    $comentarios = $_POST['empleadoComentarios'];
}
list($password, $salt) = encriptar_password($_POST['empleadoPassword']);
$data_insert = array(
    'identificador' => 'E',
    'nombre' => $_POST['empleadoNombre'],
    'paterno' => $_POST['empleadoPaterno'],
    'materno' => $_POST['empleadoMaterno'],
    'correo_electronico' => $_POST['empleadoCorreo'],
    'telefono_casa' => $_POST['empleadoTelefonoCasa'],
    'telefono_celular' => $_POST['empleadoTelefonoCelular'],
    'telefono_emergencia' => $_POST['empleadoTelefonoEmergencia'],
    'rfc' => $_POST['empleadoRfc'],
    'numero_seguro_social' => $_POST['empleadoNss'],
    'fecha_ingreso' => $_POST['empleadoFechaIngreso'],
    'password' => $password,
    'salt' => $salt,
    'activo' => $_POST['empleadoActivo'],
    'comentarios' => $comentarios,
    'fecha_de_registro' => Date('Y-m-d H:i:s')
);

$add_query = $database->insert('empleados', $data_insert);
if ($add_query) {
    // $event = 'Has succesfully created account for: ' . $name . ' ' . $last_name . ' ' . $maiden_last_name;
    // event_log($_SESSION['email'], $event, get_ip_address(), 'Create user');
    // $message      = 'Account succesfully created  for ' . $name . ' ' . $last_name . ' ' . $maiden_last_name . ' Information sent to email.';
    $message = 'Se creó la cuenta de: ' . $_POST['empleadoNombre']. ' ' . $_POST['empleadoPaterno'] . ' ' . $_POST['empleadoMaterno'];
    $data['data'] = array(
        'status' => 'success',
        'message' => $message,
    );
    // $message = 'Your SCRM account has been created with the following username: '.$username.' and the following password: '.$unencrypted_password.'
    // at the following link http://scrm.solucenterint.com.  Passwords are case sensitive.';
    // send_email_notification($email,$name.' '.$last_name.' '.$maiden_last_name,'user-create',$message,$_SESSION['email'],$session_full_name);
    echo json_encode($data);
    // return 'success';
} else {
    $message = 'Ocurrio un error al momento de crear la  cuenta de: ' . $_POST['empleadoPaterno'] . ' ' . $_POST['empleadoMaterno'];
    $data['data'] = array(
        'status' => 'error',
        'message' => $message
        
    );
    echo json_encode($data);
}
