$(document).ready(function () {
    /**
     * Session check
     * Created 15/02/2018 @ 12:12:30
     * Author:Israel Rodríguez Sánchez
     */
    function session_check() {
        $.post("work/php/users/login/session_check.php", function (data) {
            if (data == "-1") {
                swal({
                    title: "SCRM Says: ",
                    text: "Your session has expired, please log in again.",
                    icon: 'warning',
                    closeOnClickOutside: false,
                    buttons: {
                        Ok: true
                    }
                }).then((value) => {
                    switch (value) {
                        case "Ok":
                            location.reload();
                            break;
                    }
                });
            }
        });
    }
    var validateSession = setInterval(session_check, 1800000);
});