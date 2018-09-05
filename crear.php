<?php
$update1 = array(
'path_antecedentes' => ' si esta bien',
);
$update2 = array(
    'nombre' => $_POST['empleadoNombre'],
    'paterno' => $_POST['empleadoPaterno'],
    'materno' => $_POST['empleadoMaterno'],
    'correo_electronico' => $_POST['empleadoCorreo'],
    'domicilio' => $_POST['empleadoDomicilio'],
    'rfc' => $_POST['empleadoRfc'],
    'numero_seguro_social' => $_POST['empleadoNss'],
    'ciudad' => $_POST['empleadoCiudad'],
    'sucursal' => $_POST['empleadoSucursal'],
    'telefono_casa' => $_POST['empleadoTelefonoCasa'],
    'telefono_celular' => $_POST['empleadoTelefonoCelular'],
    'telefono_emergencia' => $_POST['empleadoTelefonoCelular'],
    'tipo_usuario' => $_POST['empleadoRol'],
    'activo' => $_POST['empleadoActivo'],
    'comentarios' => $_POST['empleadoComentarios'],
    'password' => $encrypted_password,
    'salt' => $salt
);
$temp = array(
    'ok' =>'yes'
);
$array3 = array_merge($update2,$update1,$temp);
echo '<pre>';
print_r($array3);
echo '</pre>';
?>