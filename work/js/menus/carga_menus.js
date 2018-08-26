$(document).ready(function () {
    $("#sucursalesAltas").off('click').click(function (e) {
        console.log('seleccionaste altas de sucursales');
        $('#main_area').load("work/php/sucursales/vistas/sucursales_altas.php");
        e.preventDefault();
    });
});