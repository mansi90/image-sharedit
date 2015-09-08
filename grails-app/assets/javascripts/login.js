var loginFunctionality;
loginFunctionality = (function () {
    var $document = $(document),
        loginForm = '#loginSection form';

    $document.ready(function () {
        $document.on('click', '.login-error-main-section .login-error-message button.close', function () {
            $('.login-error-main-section').remove();
            $('#loginSection').css('margin-top', '150px');
        });

        $document.on('click', '#loginSection form .login-submit', function () {
            validateLoginForm();
            if ($(loginForm).valid())
                $(loginForm).submit();
        });
    });

    var validateLoginForm = function () {
        $(loginForm).validate({
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                }
            }
        });
    };

    return{

    }
}());