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
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid" style="min-height: 50px">
            <a class="brand" href="${createLink(uri: '/')}">Image SharEdit</a>

            <div class="nav-collapse collapse" style="font-size: 13px">
                <ul class="nav">
                    <li class="controller"><g:link controller="report">Report</g:link></li>
                    <li class="controller"><g:link controller="user">Users</g:link></li>
                </ul>
                <g:link controller="logout" class="visible-desktop btn btn-inverse pull-right">Logout</g:link>
                <g:link controller="logout"
                        class="hidden-desktop btn btn-block btn-inverse pull-right">Logout</g:link>
                <div class="pull-right navbar-text"><i
                        class="icon-user icon-white"></i>&nbsp;Welcome&nbsp;&nbsp;&nbsp;</div>
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