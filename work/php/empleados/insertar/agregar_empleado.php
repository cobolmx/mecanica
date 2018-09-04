<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

$existe_rfc = valida_dato_unico('rfc', strtoupper($_POST['empleadoRfc']));

if ($existe_rfc == 'existe') {
    $message = 'El RFC: ' . strtoupper($_POST['empleadoRfc']) . " ya se ecuentra registrado";
    $data['data'] = array(
        'status' => 'exist',
        'message' => $message,
        'focus' => "empleadoRfc",
    );
    echo json_encode($data);
    die();
}

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
$fecha_expiracion = strtotime('+1 year', strtotime($_POST['empleadoFechaIngreso']));
$fecha_expiracion =  date('Y-m-d',$fecha_expiracion);
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
    'imagen_perfil' => 'images/user.png',
    'domicilio' => $_POST['empleadoDomicilio'],
    'sucursal' => $_POST['empleadoSucursal'],
    'fecha_expiracion' => $fecha_expiracion
);

$add_query = $database->insert('empleados', $data_insert);
if ($add_query) {
    $id_insertado = 'E' . str_pad($database->lastid(), 4, '0', STR_PAD_LEFT);
    usleep(10000);
    $directorio_antecedentes = '../../../../documentos/antecedentes_no_penales/' . $id_insertado;
    $directorio_antecedentes_bd = 'documentos/antecedentes_no_penales/' . $id_insertado;
    if (!file_exists($directorio_antecedentes)) {
        mkdir($directorio_antecedentes, 0777,true);
    }
    $directorio_antidoping = '../../../../documentos/antidoping/' . $id_insertado;
    $directorio_antidoping_db = 'documentos/antidoping/' . $id_insertado;
    if (!file_exists($directorio_antidoping)) {
        mkdir($directorio_antidoping, 0777,true);
    }
    $directorio_contrato = '../../../../documentos/contrato/' . $id_insertado;
    $directorio_contrato_db = 'documentos/contrato/' . $id_insertado;
    if (!file_exists($directorio_contrato)) {
        mkdir($directorio_contrato, 0777,true);
    }
    $directorio_imagen_perfil = '../../../../documentos/imagen_perfil/' . $id_insertado;
    $directorio_imagen_perfil_db = 'documentos/imagen_perfil/' . $id_insertado;
    if (!file_exists($directorio_imagen_perfil)) {
        mkdir($directorio_imagen_perfil, 0777,true);
    }

    /**
     * Sube archivos antidoping y antecedentes penales
     */
    if ($_FILES['empleadoAntidoping']['error'] != 0) {
        $status_upload = 'Error con el archivo: ' . $_FILES['empleadoAntidoping']['name'];
        $exitoAntidoping = 0;
    } else {
        $target_path = $directorio_antidoping . "/" . $_FILES['empleadoAntidoping']['name'];
        move_uploaded_file($_FILES['empleadoAntidoping']['tmp_name'], $target_path);
        $exitoAntidoping = 1;
    }
    if ($_FILES['empleadoAntecedentes']['error'] != 0) {
        $status_upload = 'Error con el archivo: ' . $_FILES['empleadoAntecedentes']['name'];
        $exitoAntecedentes = 0;
    } else {
        $target_path = $directorio_antecedentes . "/" . $_FILES['empleadoAntecedentes']['name'];
        move_uploaded_file($_FILES['empleadoAntecedentes']['tmp_name'], $target_path);
        $exitoAntecedentes = 1;
    }
    /**actualiza los paths para almacenar documentos imagen de perfil, antidoping, antecedentes no penales y contratos */
    $update = array(
        'path_antecedentes_penales' => $directorio_antecedentes_bd.'/'.$_FILES['empleadoAntecedentes']['name'],
        'path_contratos' => $directorio_contrato_db,
        'path_antidoping' => $directorio_antidoping_db.'/'.$_FILES['empleadoAntidoping']['name'],
        'documento_antidoping' => $exitoAntidoping,
        'documento_antecedentes' => $exitoAntecedentes
    );
    $where_clause = array(
        'CONCAT(identificador,id)' => $id_insertado
    );
    $updated = $database->update('empleados', $update, $where_clause, 1);

    $evento = 'Agrego un empleado al sistema: ' . $_POST['empleadoNombre'] . ' ' . $_POST['empleadoPaterno'] . ' ' . $_POST['empleadoMaterno'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Agregar empleado', obtener_ip());
    $message = 'Se creó la cuenta de: ' . $_POST['empleadoNombre'] . ' ' . $_POST['empleadoPaterno'] . ' ' . $_POST['empleadoMaterno'];
    $data['data'] = array(
        'status' => 'success',
        'message' => $message
    );
    echo json_encode($data);
} else {
    $message = 'Ocurrio un error al momento de crear la  cuenta de: ' . $_POST['empleadoPaterno'] . ' ' . $_POST['empleadoMaterno'];
    $data['data'] = array(
        'status' => 'error',
        'message' => $message

    );
    $evento = 'Ocurrio un error al agregar al empleado: ' . $_POST['empleadoNombre'] . ' ' . $_POST['empleadoPaterno'] . ' ' . $_POST['empleadoMaterno'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'Agregar empleado', obtener_ip());
    echo json_encode($data);
}
