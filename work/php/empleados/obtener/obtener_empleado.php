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

list($numero_empleado, $nombre, $paterno, $materno, $rfc, $numero_seguro_social, $ciudad, $domicilio, $telefono_casa, $telefono_celular, 
$telefono_emergencia, $fecha_ingreso, $tipo_usuario, $activo, $comentarios, $nombre_completo, $correo_electronico, $nombre_sucursal) = $database->get_row($query);
$number = $database->num_rows($query);

if ($number >= 1) {
    $message = 'Información del empleado encontrada';
    $data['data'] = array(
        'status' => 'success',
        'numero_empleado' => $numero_empleado,
        'nombre' => $nombre,
        'paterno' => $paterno,
        'materno' => $materno,
        'rfc' => $rfc,
        'nss' => $numero_seguro_social,
        'ciudad' => $ciudad,
        'domicilio' => $domicilio,
        'telefono_casa' => $telefono_casa,
        'telefono_celular' => $telefono_celular,
        'telefono_emergencia' => $telefono_emergencia,
        'fecha_ingreso' => $fecha_ingreso,
        'tipo_usuario' => $tipo_usuario,
        'activo' => $activo,
        'comentarios' => $comentarios,
        'correo_electronico' => $correo_electronico,
        'sucursal' => $nombre_sucursal,
        'nombre_completo' => $nombre_completo,
        'message' => $message
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