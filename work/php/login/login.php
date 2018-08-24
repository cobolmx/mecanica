<?php
require("../../../config-db/class.db.local.php");
// require_once '../../functions/functions.php';
$db       = new DB();

$numero_empleado = strtoupper($_POST['numeroEmpleado']);
$login_password = $_POST['password'];
$mensaje        = "";

$query =  "SELECT nombre, paterno, materno, salt, password FROM empleados WHERE activo = 1 AND CONCAT(identificador,id) = '".$numero_empleado."'"; 
list($nombre, $paterno, $materno, $salt, $password) = $db->get_row($query);
$number = $db->num_rows($query);
if ($number) {
    $check_password = hash('sha256', $login_password . $salt);
    for ($round = 0; $round < 65536; $round++) {
        $check_password = hash('sha256', $check_password . $salt);
    }
    if ($check_password === $password) {
        unset($salt, $password);
        $mensaje                = "Las credenciales fueron aceptadas, presionar Ok para continuar.";
        $_SESSION['numero_empleado']   = $numero_empleado;
        $_SESSION['nombre_empleado']   = $nombre. ' '.$paterno.' '.$materno; 
        $data['data']           = array(
            'status' => 'success',
            'message' => $mensaje,
            'debug' => $query
        );
        // $event                  = 'Login Success!';
        // event_log($email, $event, get_ip_address(), 'Login');        
        echo json_encode($data);
    } else {
        $mensaje      = "El usuario / contraseña son incorrectas, intente de nuevo.";
        $data['data'] = array(
            'status' => 'warning',
            'message' => $mensaje,
            'debug' => $query
        );
        // $event        = 'Login failed, username/password incorrect';
        // event_log($email, $event, get_ip_address(), 'Error');
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