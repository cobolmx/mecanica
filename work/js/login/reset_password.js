$(document).ready(function () {
    /**
     * Reset password
     * Created 22/02/2018 @ 16:43:30
     * Author:Israel Rodríguez Sánchez
     * Params @email
     * return success, error, warning
     */
    $('#recoverEmail').focus();
    /** load block page till ajax start and finish */
    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
    /**Check for user login */
    $("#recoverform").validate({
        debug: false,
        errorClass: 'text-danger',
        rules: {
            recoverEmail: "required"            
        },
        messages: {
            recoverEmail: "Please specify your username or company email."            
        },
        submitHandler: function (form) {
            var dataString = $('#recoverform').serialize();
            $.ajax({
                type: "POST",
                url: "work/php/users/login/recover_password.php",
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
                                        window.location = "index.php";
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
                                        window.location = 'index.php';
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
                                        window.location = 'index.php';
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