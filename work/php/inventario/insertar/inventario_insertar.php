<?php
require("../../../../config-db/class.db.local.php");
require("../../funciones/funciones.php");
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}

if (empty($_POST['inventarioComentarios'])) {
    $comentarios = '';
} else {
    $comentarios = $_POST['inventarioComentarios'];
}

$data_insert = array(
    'identificador' => 'A',
    'id_modelo' => $_POST['inventarioModelo'],
    'id_categoria' => $_POST['inventarioCategoria'], 
    'id_marca' => $_POST['inventarioMarca'],
    'stock' => $_POST['inventarioCantidad'],
    'comentarios' => $comentarios,
    'fecha_registro' => Date('Y-m-d H:i:s')
);
$add_query   = $database->insert('articulos', $data_insert);

if ($add_query) {
    list($categoria, $marca, $modelo) = obtener_articulo($_POST['inventarioCategoria'], $_POST['inventarioMarca'], $_POST['inventarioModelo']);
    $evento = 'Se agrego se agrego el articulo: '.$categoria.' '.$marca.' '.$modelo .' con la cantidad de: '.$_POST['inventarioCantidad'].' por el usuario: '.$_SESSION['nombre_empleado'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'agregar-articulo', obtener_ip());
    $message      = 'Se agrego se agrego el articulo: '.$categoria.' '.$marca.' '.$modelo .' con la cantidad de: '.$_POST['inventarioCantidad'].' por el usuario: '.$_SESSION['nombre_empleado'];
    $data['data'] = array(
        'status' => 'success',
        'message' => $message
    );
    // $message      = 'Your SCRM account has been created with the following username: ' . $username . ' and the following password: ' . $unencrypted_password . '
    // at the following link http://scrm.solucenterint.com.  Passwords are case sensitive.';
    // send_email_notification($email, $name . ' ' . $last_name . ' ' . $maiden_last_name, 'user-create', $message, $_SESSION['email'], $session_full_name);
    echo json_encode($data);
    
} else {
    list($categoria, $marca, $modelo) = obtener_articulo($_POST['inventarioCategoria'], $_POST['inventarioMarca'], $_POST['inventarioModelo']);
    $evento = 'Ocurrio un error al agregar el articulo: '.$categoria.' '.$marca.' '.$modelo .' con la cantidad de: '.$_POST['inventarioCantidad'].' por el usuario: '.$_SESSION['nombre_empleado'];
    registro_bitacora($_SESSION['numero_empleado'], $evento, 'agregar-articulo-error', obtener_ip());
    $message      = 'Ocurrio un error al agregar el articulo: '.$categoria.' '.$marca.' '.$modelo .' con la cantidad de: '.$_POST['inventarioCantidad'].' por el usuario: '.$_SESSION['nombre_empleado'];
    $data['data'] = array(
        'status' => 'error',
        'message' => $message
    );
    echo json_encode($data);
}
?>
