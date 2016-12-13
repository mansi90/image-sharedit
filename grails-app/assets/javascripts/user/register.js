var registerFunctionality;
registerFunctionality = (function () {
    var $document = $(document),
        registrationForm = 'form#registrationForm';

    $document.ready(function () {
        $document.on('click', 'form#registrationForm .registration-submit', function () {
            validateRegistrationForm();
            if ($(registrationForm).valid())
                $(registrationForm).submit();
        });
    });

    var validateRegistrationForm = function () {
        $(registrationForm).validate({
            rules: {
                firstName: {
                    required: true
                },
                lastName: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                username: {
                    required: true,
                    minlength: 8
                },
                password: {
                    required: true,
                    minlength:5
                },
                confirmPassword: {
                    required: true,
                    equalTo:'#password'
                }
            },
            messages : {
                confirmPassword : {
                    equalTo: "Password & Confirm Password do not match"
                }
            }
        });
    };

    return{

    }
}());