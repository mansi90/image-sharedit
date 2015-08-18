$(document).ready(function () {
    var $doc = $(document);

    $doc.on('click', '.login-error-main-section .login-error-message button.close', function () {
        $('.login-error-main-section').remove();
        $('#loginSection').css('margin-top', '150px');
    })
});