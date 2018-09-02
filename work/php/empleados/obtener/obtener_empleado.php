<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}
$search_info = $_POST['searchInfo'];
$query = "SELECT CONCAT(identificador,id) as numero_empleado, nombre, paterno, materno, rfc, numero_seguro_social, ciudad, domicilio,
                       telefono_casa, telefono_celular, telefono_emergencia, fecha_de_ingreso, tipo_usuario, activo, comentarios,
                       CONCAT(nombre,' ',paterno,' ',materno) as nombre_completo, correo_electronico, nombre_sucursal
                FROM empleados
                WHERE
                    CONCAT(identificador,id) ='" . $search_info . "' OR rfc ='" . $search_info . "' OR numero_seguro_social = '" . $search_info . "'";

list(
    $numero_empleado, $nombre, $paterno, $materno, $rfc, $numero_seguro_social, $ciudad, $domicilio, $telefono_casa, $telefono_celular,
    $telefono_emergencia, $fecha_ingreso, $tipo_usuario, $activo, $comentarios, $nombre_completo, $correo_electronico, $nombre_sucursal
) = $database->get_row($query);
$number = $database->num_rows($query);

if ($number >= 1) {
    $message = 'Información del empleado encontrada';
    $data['data'] = array(
        'status' => 'success',
        'numero_empleado' => $numero_empleado,
        'nombre' => html_entity_decode($nombre, ENT_QUOTES, "UTF-8"),
        'paterno' => html_entity_decode($paterno, ENT_QUOTES, "UTF-8"),
        'materno' => html_entity_decode($materno, ENT_QUOTES, "UTF-8"),
        'rfc' => $rfc,
        'nss' => $numero_seguro_social,
        'ciudad' => html_entity_decode($ciudad, ENT_QUOTES, "UTF-8"),
        'domicilio' => html_entity_decode($domicilio, ENT_QUOTES, "UTF-8"),
        'telefono_casa' => $telefono_casa,
        'telefono_celular' => $telefono_celular,
        'telefono_emergencia' => $telefono_emergencia,
        'fecha_ingreso' => $fecha_ingreso,
        'tipo_usuario' => $tipo_usuario,
        'activo' => $activo,
        'comentarios' => html_entity_decode($comentarios, ENT_QUOTES, "UTF-8"),
        'correo_electronico' => $correo_electronico,
        'sucursal' => html_entity_decode($nombre_sucursal, ENT_QUOTES, "UTF-8"),
        'nombre_completo' => html_entity_decode($nombre_completo, ENT_QUOTES, "UTF-8"),
        'message' => html_entity_decode($message, ENT_QUOTES, "UTF-8")
    );
    echo json_encode($data);
} else {
    $message = 'Informacion del empleado no encontrada.';
    $data['data'] = array(
        'status' => 'warning',
        'numero_empleado' => '',
        'nombre' => '',
        'paterno' => '',
        'materno' => '',
        'rfc' => '',
        'nss' => '',
        'ciudad' => '',
        'domicilio' => '',
        'telefono_casa' => '',
        'telefono_celular' => '',
        'telefono_emergencia' => '',
        'fecha_ingreso' => '',
        'tipo_usuario' => '',
        'activo' => '',
        'comentarios' => '',
        'correo_electronico' => '',
        'sucursal' => '',
        'nombre_completo' => '',
        'message' => $message
    );
    echo json_encode($data);
}
?>