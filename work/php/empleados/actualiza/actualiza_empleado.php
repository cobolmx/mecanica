<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';

$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

if (strcasecmp($_POST['empleadoRfc'], $_POST['empleadoRfcOriginal']) == 0) {
    $empleadoRfc = $_POST['empleadoRfc'];
} else {
    $existe_rfc = valida_dato_unico('rfc', strtoupper($_POST['empleadoRfc']));
    if ($existe_rfc == 'existe') {
        $message = 'El RFC: ' . strtoupper($_POST['empleadoRfc']) . " ya se ecuentra registrado";
        $data['data'] = array(
            'status' => 'exist',
            'message' => $message,
            'focus' => "empleadoRfc"
        );
        echo json_encode($data);
        die();
    }
}

if (strcasecmp($_POST['empleadoNss'], $_POST['empleadoNssOriginal']) == 0) {
    $empleadoNss = $_POST['empleadoNss'];
} else {
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
}

if (strcasecmp($_POST['empleadoCorreo'], $_POST['empleadoCorreoOriginal']) == 0) {
    $empleadoCorreo = $_POST['empleadoCorreo'];
} else {
    $existe_correo = valida_dato_unico('correo', strtoupper($_POST['empleadoCorreo']));
    if ($existe_correo == 'existe') {
        $message = 'El correo eléctronico: ' . strtoupper($_POST['empleadoCorreo']) . " ya se ecuentra registrado";
        $data['data'] = array(
            'status' => 'exist',
            'message' => $message,
            'focus' => "empleadoCorreo",
        );
        echo json_encode($data);
        die();
    }
}
if ($_FILES['empleadoAntecedentes']['error'] == 0) {
    $directorio_antecedentes = '../../../../documentos/antecedentes_no_penales/' . $_POST['empleadoNumeroEmpleado'];
    $target_path = $directorio_antecedentes . "/" . $_FILES['empleadoAntecedentes']['name'];
    if (file_exists($target_path)) {
        chmod($target_path, 0755);
        unlink($target_path);
    }
    move_uploaded_file($_FILES['empleadoAntecedentes']['tmp_name'], $target_path);
    $arrayAntecedentes = array(
        'path_antecedentes_penales' => 'documentos/antecedentes_no_penales/' . $_POST['empleadoNumeroEmpleado'] . '/' . $_FILES['empleadoAntecedentes']['name']
    );
    $exitoAntecedentes = 1;
} else {
    $arrayAntecedentes = array();
    $exitoAntecedentes = 0;
}
if ($_FILES['empleadoAntidoping']['error'] == 0) {
    $directorio_antidoping = '../../../../documentos/antidoping/' . $_POST['empleadoNumeroEmpleado'];
    $target_path = $directorio_antidoping . "/" . $_FILES['empleadoAntidoping']['name'];
    if (file_exists($target_path)) {
        chmod($target_path, 0755);
        unlink($target_path);
    }
    move_uploaded_file($_FILES['empleadoAntidoping']['tmp_name'], $target_path);
    $arrayAntidoping = array(
        'path_antidoping' => 'documentos/antidoping/' . $_POST['empleadoNumeroEmpleado'] . '/' . $_FILES['empleadoAntidoping']['name']
    );
    $exitoAntidoping = 1;
} else {
    $arrayAntidoping = array();
    $exitoAntidoping = 0;
}
/** ruta de los documentos */

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

if (!empty($_POST['empleadoPassword'])) {
    $password = $_POST['empleadoPassword'];
    list($encrypted_password, $salt) = encriptar_password($password);
    $temp = array(
        'nombre' => $_POST['empleadoNombre'],
        'paterno' => $_POST['empleadoPaterno'],
        'materno' => $_POST['empleadoMaterno'],
        'correo_electronico' => $_POST['empleadoCorreo'],
        'domicilio' => $_POST['empleadoDomicilio'],
        'rfc' => $_POST['empleadoRfc'],
        'numero_seguro_social' => $_POST['empleadoNss'],
        'ciudad' => $_POST['empleadoCiudad'],
        'sucursal' => $_POST['empleadoSucursal'],
        'telefono_casa' => $_POST['empleadoTelefonoCasa'],
        'telefono_celular' => $_POST['empleadoTelefonoCelular'],
        'telefono_emergencia' => $_POST['empleadoTelefonoCelular'],
        'tipo_usuario' => $_POST['empleadoRol'],
        'activo' => $_POST['empleadoActivo'],
        'comentarios' => $_POST['empleadoComentarios'],
        'password' => $encrypted_password,
        'salt' => $salt,
        'documento_antidoping' => $exitoAntidoping,
        'documento_antecedentes' => $exitoAntecedentes
    );
    $update = array_merge($temp, $arrayAntecedentes, $arrayAntidoping);

    $evento = 'Se actualizo información de: ' . html_entity_decode($_POST['empleadoNombre'], ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($_POST['empleadoPaterno'], ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($_POST['empleadoMaterno'], ENT_QUOTES, "UTF-8") . ' con el número de empleado: ' . $_POST['empleadoNumeroEmpleado'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Agregar empleado', obtener_ip());
    $message = 'Se creó la cuenta de: ' . html_entity_decode($_POST['empleadoNombre'], ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($_POST['empleadoPaterno'], ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($_POST['empleadoMaterno'], ENT_QUOTES, "UTF-8");
} else {
    $temp = array(
        'nombre' => $_POST['empleadoNombre'],
        'paterno' => $_POST['empleadoPaterno'],
        'materno' => $_POST['empleadoMaterno'],
        'correo_electronico' => $_POST['empleadoCorreo'],
        'domicilio' => $_POST['empleadoDomicilio'],
        'rfc' => $_POST['empleadoRfc'],
        'numero_seguro_social' => $_POST['empleadoNss'],
        'ciudad' => $_POST['empleadoCiudad'],
        'sucursal' => $_POST['empleadoSucursal'],
        'telefono_casa' => $_POST['empleadoTelefonoCasa'],
        'telefono_celular' => $_POST['empleadoTelefonoCelular'],
        'telefono_emergencia' => $_POST['empleadoTelefonoCelular'],
        'tipo_usuario' => $_POST['empleadoRol'],
        'activo' => $_POST['empleadoActivo'],
        'comentarios' => $_POST['empleadoComentarios'],
        'documento_antidoping' => $exitoAntidoping,
        'documento_antecedentes' => $exitoAntecedentes
    );
    $update = array_merge($temp, $arrayAntecedentes, $arrayAntidoping);

    $evento = 'Se actualizo información de: ' . html_entity_decode($_POST['empleadoNombre'], ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($_POST['empleadoPaterno'], ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($_POST['empleadoMaterno'], ENT_QUOTES, "UTF-8") . ' con el número de empleado: ' . $_POST['empleadoNumeroEmpleado'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Agregar empleado', obtener_ip());
    $message = 'Se creó la cuenta de: ' . html_entity_decode($_POST['empleadoNombre'], ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($_POST['empleadoPaterno'], ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($_POST['empleadoMaterno'], ENT_QUOTES, "UTF-8");
}
$where_clause = array(
    'CONCAT(identificador,id)' => $_POST['empleadoNumeroEmpleado']
);
$updated = $database->update('empleados', $update, $where_clause, 1);

if ($updated == '1') {
    $data['data'] = array(
        'status' => 'success',
        'message' => $message,
        'query' => $exitoAntecedentes . ' antidoping: ' . $exitoAntidoping
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
