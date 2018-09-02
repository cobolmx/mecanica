<?php
echo $_SERVER['DOCUMENT_ROOT'].'/documentos/';
echo '<br/>';
echo __DIR__;
echo '<br/>';
echo getcwd();
echo '<br/>';
echo $_SERVER['PHP_SELF'];
echo '<br/>';
echo dirname(__FILE__); 
// $directorio_actual = getcwd().'/documentos/antecedentes/E0000'; 
// echo $directorio_actual.'<br/>';
// if(!file_exists($directorio_actual)){
//     mkdir($directorio_actual,0777);
// }else{
//     echo 'ya existe la carpeta';
// }
?>