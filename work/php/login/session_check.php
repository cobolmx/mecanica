<?php
require("../../../../config-db/class.db.local.php");
require_once '../../functions/functions.php';

if (!isset($_SESSION['email']) || time() - $_SESSION['login_time'] > 60) {
    $database     = new DB();
    $update       = array(
        'online' => 0
    );
    $where_clause = array(
        'email' => $_SESSION['email']
    );
    $updated      = $database->update('users', $update, $where_clause, 1);
    $event        = 'Your session has expired, please log in again.';
    event_log($_SESSION['email'], $event, get_ip_address(), 'Session expiration');
    echo '-1';
    session_unset();
    session_destroy();
} else {
    echo '1';
}
?>