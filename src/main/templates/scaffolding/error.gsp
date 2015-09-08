<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <meta name="layout" content="main">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
</head>

<body>

<div class="media">
    <span class="pull-left">
        <img src="${resource(dir: 'images', file: 'error.png')}" alt="Error" class="error-image img-rounded pull-left"/>
    </span>

    <div class="media-body">
        <h4 class="text-error">Oops!</h4>

        <p class="text-error">We encountered an error while processing your request. Please try again. <a href="${createLink(uri: '/')}">here</a></p>
    </div>
</div>

</body>
</html>
