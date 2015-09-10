<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Image SharEdit | Login</title>
    <meta content="css3, login, form, custom, input, submit, button, html5, placeholder" name="keywords">
    <asset:stylesheet src="theme.css"/>
    <asset:stylesheet src="login.css"/>
    <asset:javascript src="modernizr.custom.63321.js"/>
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:javascript src="jquery.validate.js"/>
    <asset:javascript src="login.js"/>
    <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
</head>

<body>
<div class="container">
    <div class="codrops-top">
        <a href="${createLink(uri: '/')}">
            <strong>« Image SharEdit</strong>
        </a>
        <a href="${createLink(controller: 'login', action: 'register')}" class="register-link">
            <strong>Register</strong>
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
        <form class="form-4" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
            %{--<h1>Login</h1>--}%

            <p>
                <label for="username">Username</label>
                <input type="text" name="j_username" id="username" placeholder="Username" required="">
            </p>

            <p>
                <label for="password">Password</label>
                <input type="password" name="j_password" id="password" placeholder="Password" required="">
            </p>

            <p style="display: none">
                <label class="remember" for="remember">
                    <input type='checkbox' name='${rememberMeParameter}' id='remember'
                           <g:if test='${hasCookie}'>checked='checked'</g:if>/>Remember me</label>
            </p>

            <p>
                <g:submitButton name="submit" value="Continue"/>

            </p>
        </form>
    </section>
</div>
</body>
</html>
