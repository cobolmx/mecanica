<?php
require("config-db/class.db.local.php");
// include_once 'work/php/functions/functions.php';
// $database     = new DB();
// $update       = array(
//     'online' => 0
// );
// $where_clause = array(
//     'email' => $_SESSION['email']
// );
// $event        = 'Logout success';
// event_log($_SESSION['email'], $event, get_ip_address(), 'Log out');
// $database->update('users', $update, $where_clause, 1);
session_unset();
session_destroy();
header("Location: index.php");
die("Redirecting to: index.php");
?>
