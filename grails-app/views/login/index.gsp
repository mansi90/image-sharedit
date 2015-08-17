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
<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway:400,700);

body {
    background: #7f9b4e url(/assets/bg2.jpg) no-repeat center top;
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
    <section class="main" style="margin-top: 150px">
        <form class="form-4">
            %{--<h1>Login</h1>--}%

            <p>
                <label for="login">Username or email</label>
                <input type="text" required="" placeholder="Username or email" name="login">
            </p>

            <p>
                <label for="password">Password</label>
                <input type="password" required="" placeholder="Password" name="password">
            </p>

            <p>
                <input type="submit" value="Continue" name="submit">
            </p>
        </form>&#8203;
    </section>
</div>
</body>
</html>