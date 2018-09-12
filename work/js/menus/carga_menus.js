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
    /**
     * usuarios
     */
    $("#usuarioPassword,#usuarioPasswordDrop").off('click').click(function (e) {        
        $('#main_area').load("work/php/usuario/vistas/usuario_password.php");
        e.preventDefault();
    });
    /**
     * Inventarios
     */
    $("#inventarioAltas").off('click').click(function (e) {        
        $('#main_area').load("work/php/inventario/vistas/inventario_altas.php");
        e.preventDefault();
    });
    //categorias
    $("#categoriaAltas").off('click').click(function (e) {        
        $('#main_area').load("work/php/inventario/vistas/categoria_altas.php");
        e.preventDefault();
    });
    //Marcas
    $("#marcaAltas").off('click').click(function (e) {        
        $('#main_area').load("work/php/inventario/vistas/marca_altas.php");
        e.preventDefault();
    });
     //Modelos
     $("#modeloAltas").off('click').click(function (e) {        
        $('#main_area').load("work/php/inventario/vistas/modelo_altas.php");
        e.preventDefault();
    });
    //asignar articulos
    $("#inventarioAsignar").off('click').click(function (e) {        
        $('#main_area').load("work/php/inventario/vistas/asignar_articulo.php");
        e.preventDefault();
    });
});