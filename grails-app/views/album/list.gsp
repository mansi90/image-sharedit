<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-album" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-album" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="name" title="Name"/>
            <g:sortableColumn property="description" title="Description"/>
            <g:sortableColumn property="owner" title="Owner"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${albumList}" status="i" var="albumInstance">
            <tr class="${i % 2 == 0 ? "even" : "odd"}">
                <td><g:link controller="album" action="show" id="${albumInstance.id}">${albumInstance.name}</g:link> </td>
                <td>${albumInstance.description}</td>
                <td><g:link controller="user" action="show"
                            id="${albumInstance.owner.id}">${albumInstance.owner}</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <g:if test="${albumTotal > 10}">
        <div class="pagination pull-right">
            <g:paginate total="${albumTotal ?: 0}"/>
        </div>
    </g:if>
</div>
</body>
</html>