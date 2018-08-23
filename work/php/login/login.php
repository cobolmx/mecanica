<?php
require("../../../../config-db/class.db.local.php");
require_once '../../functions/functions.php';
$database       = new DB();
$findme         = '@';
// $login_ok = false;
$username       = $_POST['username'];
$login_password = $_POST['password'];
$message        = "";
switch (is_numeric(strpos($username, $findme))) {
    case '1':
        $sql_string = "email ='" . $username . "'";
        break;
    case '0':
        $sql_string = "username = '" . $username . "'";
        break;
}
$query = "SELECT id, username, password, salt, email FROM users WHERE active = 1 AND " . $sql_string;
list($id, $username, $password, $salt, $email) = $database->get_row($query);
$number = $database->num_rows($query);
if ($number) {
    $check_password = hash('sha256', $login_password . $salt);
    for ($round = 0; $round < 65536; $round++) {
        $check_password = hash('sha256', $check_password . $salt);
    }
    if ($check_password === $password) {
        unset($salt, $password);
        $message                = "Credentials are accepted, please press Ok to continue.";
        $_SESSION['username']   = $username;
        $_SESSION['email']      = $email;
        $_SESSION['login_time'] = time();
        $data['data']           = array(
            'status' => 'success',
            'message' => $message,
            'debug' => $query
        );
        $event                  = 'Login Success!';
        event_log($email, $event, get_ip_address(), 'Login');
        /**
         * Flag online user
         */
        $update       = array(
            'online' => 1
        );
        $where_clause = array(
            'email' => $email
        );
        $updated      = $database->update('users', $update, $where_clause, 1);
        echo json_encode($data);
    } else {
        $message      = "Incorrect username / password, please try again.";
        $data['data'] = array(
            'status' => 'warning',
            'message' => $message,
            'debug' => $query
        );
        $event        = 'Login failed, username/password incorrect';
        event_log($email, $event, get_ip_address(), 'Error');
        echo json_encode($data);
    }
} else {
    $message      = "The user doesn't exist.";
    $data['data'] = array(
        'status' => 'error',
        'message' => $message,
        'debug' => $query
    );
    echo json_encode($data);
}
?>