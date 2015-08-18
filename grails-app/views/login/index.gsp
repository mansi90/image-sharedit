<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Image SharEdit | Login</title>
    <meta content="css3, login, form, custom, input, submit, button, html5, placeholder" name="keywords">
    <asset:stylesheet src="login.css"/>
    <asset:javascript src="modernizr.custom.63321.js"/>
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:javascript src="jquery.validate.js"/>
    <asset:javascript src="login.js"/>
    <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    <style type="text/css">
    @import url(http://fonts.googleapis.com/css?family=Raleway:400,700);

    body {
        background: #7f9b4e url(/assets/bg3.jpg) no-repeat center top;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        background-size: cover;
    }

    .container > header h1,
    .container > header h2 {
        color: #fff;
        text-shadow: 0 1px 1px rgba(0, 0, 0, 0.7);
    }
    </style>
</head>

<body>
<div class="container">
    <div class="codrops-top">
        <a href="${createLink(uri: '/')}">
            <strong>« Image SharEdit</strong>
        </a>

    </div>
    <g:if test="${flash.message}">
        <section class="main login-error-main-section">
            <div class="alert alert-error login-error-message">
                <button type="button" class="close" data-dismiss="alert">×</button>
                ${flash.message}
            </div>
        </section>
    </g:if>

    <section id="loginSection" class="main" style="margin-top: ${flash.message ? '' : '150px'}">
        <g:form class="form-4" controller="login" action="onSubmit">
        %{--<h1>Login</h1>--}%

            <p>
                <label for="login">Username or email</label>
                <input type="text" name="email" placeholder="Email Address">
            </p>

            <p>
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="Password">
            </p>

            <p>
                <g:submitButton name="submit" class="login-submit" value="Continue"/>
            </p>
        </g:form>
    </section>
</div>
</body>
</html>