<?php
require("../../../../config-db/class.db.local.php");
require_once '../../funciones/funciones.php';
$database = new DB();
foreach ($_POST as $key => $value) {
    $_POST[$key] = $database->filter($value);
}
/**
 * _POST Vars
 */

$existe_rfc = valida_dato_unico('rfc',$_POST['empleadoRfc']);
if($existe_rfc == 'existe'){    
        $message      = 'El RFC: ' . $_POST['empleadoRfc'];
        $data['data'] = array(
            'status' => 'exist',
            'message' => $message
        );
        echo json_encode($data);
        die();
}
$existe_nss = valida_dato_unico('nss',$_POST['empleadoNss']);
if($existe_nss == 'existe'){    
    $message      = 'El Número de seguro social: ' . $_POST['empleadoRfc'].' ya existe';
    $data['data'] = array(
        'status' => 'exist',
        'message' => $message
    );
    echo json_encode($data);
    die();
}

if (empty($_POST['empleadoTelefonoCasa'])) {
    $telefono_casa = '';
} else {
    $telefono_casa = $_POST['empleadoTelefonoCasa'];
}
if (empty($_POST['empleadoTelefonoCelular'])) {
    $telefono_celular = '';
} else {
    $telefono_celular = $_POST['empleadoTelefonoCelular'];
}
if (empty($_POST['empleadoTelefonoEmergencia'])) {
    $telefono_emergencia = '';
} else {
    $telefono_emergencia = $_POST['empleadoTelefonoCelular'];
}
$data_insert = array(
    'nombre' => $_POST['empleadoNombre'],
    'paterno' => $_POST['empleadoPaterno'],
    'materno' => $_POST['empleadoMaterno'],
    'correo_electronico' => $_POST['empleadoCorreo'],
    'telefono_casa' => $_POST['empleadoTelefonoCasa']
);
/*falta*/
// switch ($result) {
//     case 'success':
//         $event = 'Has succesfully created account for: ' . $name . ' ' . $last_name . ' ' . $maiden_last_name;
//         event_log($_SESSION['email'], $event, get_ip_address(), 'Create user');
//         $message      = 'Account succesfully created  for ' . $name . ' ' . $last_name . ' ' . $maiden_last_name . ' Information sent to email.';
//         $data['data'] = array(
//             'status' => 'success',
//             'message' => $message
//         );
//         $message = 'Your SCRM account has been created with the following username: '.$username.' and the following password: '.$unencrypted_password.'
//         at the following link http://scrm.solucenterint.com.  Passwords are case sensitive.';
//         send_email_notification($email,$name.' '.$last_name.' '.$maiden_last_name,'user-create',$message,$_SESSION['email'],$session_full_name);
//         echo json_encode($data);
//         break;   
//     case 'error':
//         $event = 'Has failed to created account for: ' . $name . ' ' . $last_name . ' ' . $maiden_last_name;
//         event_log($_SESSION['email'], $event, get_ip_address(), 'Create user');
//         $message      = 'Account failed to created  for ' . $name . ' ' . $last_name . ' ' . $maiden_last_name . '<br/>And information sent to email.';
//         $data['data'] = array(
//             'status' => 'error',
//             'message' => $message
//         );
//         echo json_encode($data);
//         break;
// }
?>
