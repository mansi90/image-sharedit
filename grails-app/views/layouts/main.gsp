<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <style type="text/css">
    body {
        padding-top: 60px;
        padding-bottom: 40px;
    }
    </style>
    <g:layoutHead/>
</head>

<body>
<div id="top-navigation" class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div  class="container-fluid">
            <a class="brand" href="${createLink(uri: '/')}">Image SharEdit</a>

            <div class="navigation-details">
                <ul>
                    <li class="controller"><g:link controller="user">Users</g:link></li>
                    <li class="controller"><g:link controller="image">Images</g:link></li>
                    <li class="controller pull-right logout-link"><a href="${createLink(uri: '/logout')}">Logout</a></li>
                    <li class="controller pull-right gallery-link"><a href="${createLink(uri: '/gallery')}">Gallery</a></li>
                    <li class="controller pull-right profile-link"><a href="${createLink(uri: '/profile')}">Profile</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <g:if test="${flash.message}">
                <div class="alert alert-success">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    ${flash.message}
                </div>
            </g:if>
            <g:layoutBody/>
        </div>
    </div>
    <footer>
        <div class="navbar navbar-fixed-bottom navbar-static">
            %{--<p>&copy;&nbsp;<a href="http://www.someurl.com/">Company Name</a></p>--}%
        </div>
    </footer>
</div>

<div id="spinner" class="spinner" style="display:none;">
    <img id="img-spinner" src="${resource(dir: 'images', file: 'spinner.gif')}" alt="Loading"/>
</div>
<r:layoutResources/>
</body>
</html>