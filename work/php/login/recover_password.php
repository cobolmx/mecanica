<?php
require("../../../../config-db/class.db.local.php");
require_once '../../functions/functions.php';
$database = new DB();
$email    = $_POST['recoverEmail'];

$query = "SELECT CONCAT(name,' ',last_name, ' ',maiden_last_name) as full_name, active FROM users WHERE email ='" . $email . "'";
list($full_name, $active) = $database->get_row($query);
$number = $database->num_rows($query);
if ($number) {
    $unencrypted_password = generate_password(8);
    list($encrypted_password, $salt) = encrypted_password($unencrypted_password); 
    $update       = array(
        'password' => $encrypted_password,
        'salt' => $salt
    );
    $where_clause = array(
        'email' => $email
    );
    $updated      = $database->update('users', $update, $where_clause, 1);    
    if($updated){
        $event = 'Password reset request: ' . $full_name;
        event_log($email, $event, get_ip_address(), 'Password reset');
        $message = html_entity_decode($full_name, ENT_QUOTES, "UTF-8").' your password has been sent to: '.$email.' please follow the instructions in your email.';
        $email_message = 'Your password reset request, here is your new password: <b>'.$unencrypted_password.'</b><br/>You can change your password once you login under my profile, please bear in mind passwords are case sensetive.';
        send_email_notification($email,utf8_encode($full_name),'password-reset-user',$email_message,'','');
        $data['data']           = array(
            'status' => 'success',
            'message' => $message            
        );
        echo json_encode($data);
        // die();
    }else{
        $message = 'Has occured an error, please try again later';
        $data['data']           = array(
            'status' => 'warning',
            'message' => $message            
        );
        echo json_encode($data);
    }    
}else{
    $message = 'Email: '.$email.' is not in our system.';
        $data['data']           = array(
            'status' => 'error',
            'message' => $message            
        );
        echo json_encode($data);
}
?>