<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>My Profile</title>
    <asset:stylesheet src="theme.css"/>
    <asset:stylesheet src="user/profile.css"/>
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:javascript src="jquery.validate.js"/>
    <asset:javascript src="user/profile.js"/>
</head>

<body>
<div class="codrops-top">
    <a href="/">
        <strong>« Image SharEdit</strong>
    </a>
</div>

<g:form name="profileForm" class="form-1" controller="user" action="update" method="put">
    <g:hiddenField name="id" value="${currentUser.id}"/>
    <g:hiddenField name="version" value="${currentUser.version}"/>
    <h1>My Profile</h1>

    <p>
        <label for="firstName">First Name</label>
        <g:textField name="firstName" value="${currentUser.firstName}" placeholder="First Name"/>
    </p>

    <p>
        <label for="lastName">Last Name</label>
        <g:textField name="lastName" value="${currentUser.lastName}" placeholder="Last Name"/>
    </p>

    <p>
        <label for="email">Email</label>
        <g:textField name="email" type="email" value="${currentUser.email}" placeholder="Email"/>
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
        <g:submitButton name="submit" class="profile-submit" value="Update"/>
    </p>
</g:form>
</body>
</html>