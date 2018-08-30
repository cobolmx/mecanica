<?php
date_default_timezone_set('America/Tijuana');
/** Funciones de proposito general
 * Autor: Israel Rodríguez Sánchez
 * Email: irodrigu@gmail.com
 * 24/08/2018 
 **/

/**
 * Funcion de registro de bitacora
 * @param $numero_empleado: numero identificador del empleado
 * @param $tipo_evento: tipo de evento
 * @param $evento: Descripcion del evento
 */
function registro_bitacora($numero_empleado, $evento, $tipo_evento, $direccion_ip) {
    $db                  = new DB();
    $fecha_hora_registro = Date('Y-m-d H:i:s');
    $insertar_info       = array(
        'numero_empleado' => $numero_empleado,
        'direccion_ip' => $direccion_ip,
        'evento' => $evento,
        'tipo_evento' => $tipo_evento,
        'fecha_hora_registro' => $fecha_hora_registro
        
    );
    $ejecutar_query      = $db->insert('bitacora_eventos', $insertar_info);
}
//revisa si ya existe un numero de seguro social o rfc
// regresa existe si existe, no_existe si no y puede proceder
function valida_dato_unico($tipo,$cadena) {
    $databse = new DB();
    $query = 'SELECT rfc FROM empleados rfc = "'.$cadena."'";
    switch($tipo){
        case 'rfc':            
            $resultado = $database->num_rows($query);        
        break;
        case 'nss': 
            $resultado = $database->num_rows($query);
        break;
    }    
    if ($resultado == 0 ) {        
        return 'no_existe';
    } else {
        return 'existe';
    }
}
//funcion para obtener un ip publico o privado dependiendo si es intranet 
function obtener_ip() {
    // Revisa el ip del proveedor de internet
    if (!empty($_SERVER['HTTP_CLIENT_IP']) && validar_ip($_SERVER['HTTP_CLIENT_IP'])) {
        return $_SERVER['HTTP_CLIENT_IP'];
    }
    // Revisa si esta pasando por algunos proxies
    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        //revisa si existen multiples ip en la variable
        if (strpos($_SERVER['HTTP_X_FORWARDED_FOR'], ',') !== false) {
            $iplist = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            foreach ($iplist as $ip) {
                if (validar_ip($ip))
                    return $ip;
            }
        } else {
            if (validar_ip($_SERVER['HTTP_X_FORWARDED_FOR']))
                return $_SERVER['HTTP_X_FORWARDED_FOR'];
        }
    }
    if (!empty($_SERVER['HTTP_X_FORWARDED']) && validar_ip($_SERVER['HTTP_X_FORWARDED']))
        return $_SERVER['HTTP_X_FORWARDED'];
    if (!empty($_SERVER['HTTP_X_CLUSTER_CLIENT_IP']) && validar_ip($_SERVER['HTTP_X_CLUSTER_CLIENT_IP']))
        return $_SERVER['HTTP_X_CLUSTER_CLIENT_IP'];
    if (!empty($_SERVER['HTTP_FORWARDED_FOR']) && validar_ip($_SERVER['HTTP_FORWARDED_FOR']))
        return $_SERVER['HTTP_FORWARDED_FOR'];
    if (!empty($_SERVER['HTTP_FORWARDED']) && validar_ip($_SERVER['HTTP_FORWARDED']))
        return $_SERVER['HTTP_FORWARDED'];
    // regresa un ip tonto si todo lo demas falla
    return $_SERVER['REMOTE_ADDR'];
}

//Funcion para asegurar que los ip validos no esten dentro de una red privada (red interna)
function validar_ip($ip) {
    if (strtolower($ip) === 'unknown')
        return false;
    //genera un direccion de red ipv4
    $ip = ip2long($ip);
    // si el ip es inicializado y que no sea equivalente a  255.255.255.255
    if ($ip !== false && $ip !== -1) {
        //asegurarse de que en la representacion del tipo sin signo  de un ip
        //por las discrepancias entre los sistemas operativos de 32 y 64 bits
        //numeros con signo ( enteros por defecto son firmados en php)
        $ip = sprintf('%u', $ip);
        // revisa el rango de una red privada
        if ($ip >= 0 && $ip <= 50331647)
            return false;
        if ($ip >= 167772160 && $ip <= 184549375)
            return false;
        if ($ip >= 2130706432 && $ip <= 2147483647)
            return false;
        if ($ip >= 2851995648 && $ip <= 2852061183)
            return false;
        if ($ip >= 2886729728 && $ip <= 2887778303)
            return false;
        if ($ip >= 3221225984 && $ip <= 3221226239)
            return false;
        if ($ip >= 3232235520 && $ip <= 3232301055)
            return false;
        if ($ip >= 4294967040)
            return false;
    }
    return true;
}

/**
 * funcion para convertir a utf8 si es que se encuentra corrupo la cadena
 */
function to_utf8($string) {
    if (is_array($string)) {
        foreach ($string as $key => $value) {
            $out[to_utf8($key)] = to_utf8($value);
        }
    } elseif (is_string($string)) {
        if (mb_detect_encoding($string) != "UTF-8")
            return utf8_encode($string);
        else
            return $string;
    } else {
        return $string;
    }
    return $out;
}
?>