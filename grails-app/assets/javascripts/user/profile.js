var profileFunctionality;
profileFunctionality = (function () {
    var $document = $(document),
        profileForm = 'form#profileForm';

    $document.ready(function () {
        $document.on('click', 'form#profileForm .profile-submit', function () {
            validateProfileForm();
            if ($(profileForm).valid())
                $(profileForm).submit();
        });
    });

    var validateProfileForm = function () {
        $(profileForm).validate({
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