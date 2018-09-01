$(document).ready(function () {
    /**
     * SUCURSALES
     */
    $("#sucursalesAltas").off('click').click(function (e) {        
        $('#main_area').load("work/php/sucursales/vistas/sucursales_altas.php");
        e.preventDefault();
    });
    /**
     * ROLES
     */
    $("#rolesAltas").off('click').click(function (e) {        
        $('#main_area').load("work/php/roles/vistas/roles_altas.php");
        e.preventDefault();
    });
    /**
     * EMPLEADOS
     */
    $("#empleadosAltas").off('click').click(function (e) {        
        $('#main_area').load("work/php/empleados/vistas/empleados_altas.php");
        e.preventDefault();
    });
    $("#empleadosModificaciones").off('click').click(function (e) {        
        $('#main_area').load("work/php/empleados/vistas/empleados_modificaciones.php");
        e.preventDefault();
    });
});