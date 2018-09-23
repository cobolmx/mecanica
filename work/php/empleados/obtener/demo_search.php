<?php
require("../../../../config-db/class.db.local.php");
$database = new DB();
$request = $_POST['query'];
$query = "SELECT CONCAT(identificador,id) as numero_empleado, CONCAT(nombre,' ' ,paterno,' ', materno) as nombre_completo
          FROM empleados
          WHERE  CONCAT(nombre,' ' ,paterno,' ', materno) like '%".$request."%'";

$results = $database->get_results($query);
$number = $database->num_rows($query);
if ($number >= 1) {
    foreach ($results as $row) {
        $data = [
         'numero_empleado' => $row['numero_empleado'],  
         'nombre' =>  html_entity_decode($row['nombre_completo'], ENT_QUOTES, "UTF-8")                   
        ];
    }
    echo json_encode($data);
} else {
    $data = [
        'numero_empleado' => '',
        'nombre' => ''        
    ];
    echo json_encode($data);
}
?>