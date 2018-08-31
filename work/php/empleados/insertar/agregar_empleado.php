<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$existe_rfc = valida_dato_unico('rfc', strtoupper($_POST['empleadoRfc']));

if ($existe_rfc == 'existe') {
    $message = 'El RFC: ' . strtoupper($_POST['empleadoRfc'])." ya se ecuentra registrado";
    $data['data'] = array(
        'status' => 'exist',
        'message' => $message,
        'focus' => "empleadoRfc",
    );
    echo json_encode($data);
    die();
}

$existe_nss = valida_dato_unico('nss', strtoupper($_POST['empleadoNss']));
if ($existe_nss == 'existe') {
    $message = 'El Número de seguro social: ' . strtoupper($_POST['empleadoNss']) . ' ya se encuentra registrado';
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
    'rfc' => strtoupper($_POST['empleadoRfc']),
    'numero_seguro_social' => strtoupper($_POST['empleadoNss']),
    'fecha_de_ingreso' => $_POST['empleadoFechaIngreso'],
    'password' => $password,
    'salt' => $salt,
    'activo' => $_POST['empleadoActivo'],
    'comentarios' => $comentarios,
    'fecha_de_registro' => Date('Y-m-d H:i:s'),
    'tipo_usuario' => $_POST['empleadoRol'],
    'ciudad' => $_POST['empleadoCiudad'],
    'imagen_perfil' => 'images/user.png'
);

$add_query = $database->insert('empleados', $data_insert);
if ($add_query) {
    $evento = 'Agrego un empleado al sistema: '.$_POST['empleadoNombre'].' '.$_POST['empleadoPaterno'].' '.$_POST['empleadoMaterno'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Agregar empleado', obtener_ip());
    $message = 'Se creó la cuenta de: ' . $_POST['empleadoNombre']. ' ' . $_POST['empleadoPaterno'] . ' ' . $_POST['empleadoMaterno'];
    $data['data'] = array(
        'status' => 'success',
        'message' => $message,
    );    
    echo json_encode($data);    
} else {
    $message = 'Ocurrio un error al momento de crear la  cuenta de: ' . $_POST['empleadoPaterno'] . ' ' . $_POST['empleadoMaterno'];
    $data['data'] = array(
        'status' => 'error',
        'message' => $message
        
    );
    $evento = 'Ocurrio un error al agregar al empleado: '.$_POST['empleadoNombre'].' '.$_POST['empleadoPaterno'].' '.$_POST['empleadoMaterno'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Agregar empleado', obtener_ip());
    echo json_encode($data);
}
