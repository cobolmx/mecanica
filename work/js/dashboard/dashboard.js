$(document).ready(function () { 
    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
    // var tablaSucursales =
     $('#listaSucursales').DataTable({
        responsive: true,
        retrieve: true,
        searching: false,
        paging: false,
        info: false,  
        // order: [[1, 'asc']],
        // rowGroup: {
        //     // Group by office
        //     dataSrc: '1'
        // },
        "columnDefs": [
            {   "targets": [ 1 ],
                "visible": false                              
            }],
        // "drawCallback": function ( settings ) {
        //     var api = this.api();
        //     var rows = api.rows( {page:'current'} ).nodes();
        //     var last=null;
 
        //     api.column(1, {page:'current'} ).data().each( function ( group, i ) {
        //         if ( last !== group ) {
        //             $(rows).eq( i ).before(
        //                 '<tr class="group"><td colspan="5" bgcolor="#D3D3D3">'+group+'</td></tr>'
        //             );
 
        //             last = group;
        //         }
        //     } );
        // },                
        "ajax": {
            url: "work/php/dashboard/obtener/obtener_lista_sucursales.php",
            dataType: "json"            
        },
        "columns": [
            { "data": "nombre" },
            { "data": "ciudad" },
            { "data": "direccion" },
            { "data": "telefono" }            
        ]       
    });
    // tablaSucursales.ajax.reload();
    // $('#listaSucursales tbody').on( 'click', 'tr.group', function () {
    //     var currentOrder = tablaSucursales.order()[0];
    //     if ( currentOrder[0] === 1 && currentOrder[1] === 'asc' ) {
    //         tablaSucursales.order( [ 1, 'desc' ] ).draw();
    //     }
    //     else {
    //         tablaSucursales.order( [ 1, 'asc' ] ).draw();
    //     }
    // } );
});