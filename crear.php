<?php
$directorio_actual = getcwd(); 
echo $directorio_actual;
if(mkdir($directorio_actual."/documentos/antecedentes/E0000",0777)){
    echo 'Directorio creado';
}else{
    echo 'fallo en la creacion';
}

?>