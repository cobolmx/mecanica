$(document).ready(function () {
    /**
     * Login 
     * Created 15/02/2018 @ 12:12:30
     * Author:Israel Rodríguez Sánchez
     * Params @email/username @password
     * return success, error, warning
     */
    $('#username').focus();
    /** load block page till ajax start and finish */
    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
    /**Check for user login */
    $("#loginForm").validate({
        debug: false, 
        errorClass: 'text-danger',
        rules: {
            username: "required",
            password: "required"
        },
        messages: {
            username: "Please specify your username or company email",
            password: "A password is required."
        },
        submitHandler: function (form) {
            var dataString = $('#loginForm').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/users/login/login.php",
                data: dataString,
                dataType: "json",
                success: function (result) {
                    switch (result['data'].status) {
                        case 'success':
                            swal({
                                title: "SCRM Says: ",
                                text: result['data'].message,
                                icon: 'success',
                                closeOnClickOutside: false,
                                buttons: {
                                    Ok: true
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Ok":
                                        window.location = "dashboard.php";                                        
                                        break;
                                }
                            });                            
                            break;
                        case 'warning':
                            swal({
                                title: "SCRM Says: ",
                                text: result['data'].message,
                                icon: 'warning',
                                closeOnClickOutside: false,
                                buttons: {
                                    Ok: true
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Ok":
                                        $('#username').val('');
                                        $('#password').val('');
                                        $('#username').focus();
                                        break;
                                }
                            });
                            break;
                        case 'error':
                            swal({
                                title: "SCRM Says: ",
                                text: result['data'].message,
                                icon: 'error',
                                closeOnClickOutside: false,
                                buttons: {
                                    Ok: true
                                }
                            }).then((value) => {
                                switch (value) {
                                    case "Ok":
                                        $('#username').val('');
                                        $('#password').val('');
                                        $('#username').focus();
                                        break;
                                }
                            });
                            break;
                    }
                }
            });
            return false; // required to block normal submit since you used ajax            
        }
    });
});