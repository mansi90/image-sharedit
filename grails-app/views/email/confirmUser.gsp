<%@ page contentType="text/html" %>
<html>
<head>
    <meta content="mail" name="layout">
</head>

<body>
<div>
    <p>Dear ${user.firstName},</p>

    <p>We received a request to create an account for you with username : <b>${user.username}</b>.</p>

    <p>Please click the following link to confirm your account. This link will become invalid once you activate your account.</p>

    <p><g:createLink uri="/verifyAccount" absolute="true" params="[token: token]"/></p>

    <p>If you're unable to click the link above, copy and paste it into your web browser.</p>

    <p>Regards,<br/>
        ImageSharEdit Team
    </p>
</div>
</body>
</html>