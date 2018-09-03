<?php
require("../../../config-db/class.db.local.php");
require("../funciones/funciones.php");
$db = new DB();

$numero_empleado = strtoupper($_POST['numeroEmpleado']);
$login_password  = $_POST['password'];
$mensaje         = "";

$query = "SELECT nombre, paterno, materno, salt, password, nombre_sucursal, ciudad, tipo_usuario, imagen_perfil FROM empleados WHERE activo = 1 AND CONCAT(identificador,id) = '" . $numero_empleado . "'";
list($nombre, $paterno, $materno, $salt, $password, $sucursal, $ciudad, $tipo_usuario, $imagen_perfil) = $db->get_row($query);
$number = $db->num_rows($query);
if ($number) {
    $check_password = hash('sha256', $login_password . $salt);
    for ($round = 0; $round < 65536; $round++) {
        $check_password = hash('sha256', $check_password . $salt);
    }
    if ($check_password === $password) {
        unset($salt, $password);
        $mensaje                     = "Que gusto de verte de nuevo " . html_entity_decode($nombre, ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($paterno, ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($materno, ENT_QUOTES, "UTF-8");
        $_SESSION['numero_empleado'] = $numero_empleado;
        $_SESSION['nombre_empleado'] = html_entity_decode($nombre, ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($paterno, ENT_QUOTES, "UTF-8") . ' ' . html_entity_decode($materno, ENT_QUOTES, "UTF-8");
        $_SESSION['nombre_sucursal'] = html_entity_decode($sucursal, ENT_QUOTES, "UTF-8");
        $_SESSION['ciudad']          = html_entity_decode($ciudad, ENT_QUOTES, "UTF-8");
        $_SESSION['tipo_usuario']    = $tipo_usuario;
        $_SESSION['imagen_perfil']   = $imagen_perfil;
        $data['data']                = array(
            'status' => 'success',
            'message' => $mensaje,
            'debug' => $query
        );
        $evento                      = 'Inicio de sesion correcta';
        registro_bitacora($numero_empleado, $evento, 'Inicio de sesion', obtener_ip());
        echo json_encode($data);
    } else {
        $mensaje      = "El usuario / contraseña son incorrectas, intente de nuevo.";
        $data['data'] = array(
            'status' => 'warning',
            'message' => $mensaje,
            'debug' => $query
        );
        $evento       = 'Inicio de sesion fallida, el número de empleado /  contraseña son incorrectos';
        registro_bitacora($numero_empleado, $evento, 'Inicio de sesion', obtener_ip());
        echo json_encode($data);
    }
} else {
    $mensaje      = "El empleado no existe";
    $data['data'] = array(
        'status' => 'error',
        'message' => $mensaje,
        'debug' => $query
    );
    echo json_encode($data);
}
?>