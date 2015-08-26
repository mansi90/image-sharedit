<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <asset:stylesheet src="theme.css"/>
    <asset:stylesheet src="user/register.css"/>
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:javascript src="jquery.validate.js"/>
    <asset:javascript src="user/register.js"/>
</head>

<body>
<div class="codrops-top">
    <a href="/">
        <strong>« Image SharEdit</strong>
    </a>
</div>
<g:form name="registrationForm" class="form-1" controller="login" action="onRegister">
    <h1>Registration Form</h1>

    <p>
        <label for="firstName">First Name</label>
        <g:textField name="firstName" placeholder="First Name"/>
    </p>

    <p>
        <label for="lastName">Last Name</label>
        <g:textField name="lastName" placeholder="Last Name"/>
    </p>

    <p>
        <label for="email">Email</label>
        <g:textField name="email" type="email" placeholder="Email"/>
    </p>

    <p>
        <label for="password">Password</label>
        <g:passwordField name="password" placeholder="Password"/>
    </p>

    <p>
        <label for="confirmPassword">Confirm Password</label>
        <g:passwordField name="confirmPassword" placeholder="Confirm Password"/>
    </p>

    <p>
        <g:submitButton name="submit" class="registration-submit" value="Register"/>
    </p>
</g:form>
</body>
</html>