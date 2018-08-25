<?php
require("config-db/class.db.local.php");
include_once 'work/php/funciones/funciones.php';
// $database     = new DB();
// $update       = array(
//     'online' => 0
// );
// $where_clause = array(
//     'email' => $_SESSION['email']
// );
$evento = 'Cierre de sesión';
registro_bitacora($_SESSION['numero_empleado'], $evento, 'Cierre de sesión', obtener_ip());
// $database->update('users', $update, $where_clause, 1);
session_unset();
session_destroy();
header("Location: index.php");
die("Redirecting to: index.php");
?>
