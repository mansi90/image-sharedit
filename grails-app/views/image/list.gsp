<%@ page import="image.sharedit.Constants" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <asset:stylesheet src="image/list.css"/>
</head>

<body>
<a href="#list-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-image" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table>
        <thead>
        <tr>
            <th>Image</th>
            <g:sortableColumn property="name" title="Name"/>
            <th>Description</th>
            <g:sortableColumn property="owner" title="Owner"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${imageList}" status="i" var="imageInstance">
            <tr class="${i % 2 == 0 ? "even" : "odd"}" style="height: ${Constants.thumbnailSize}px;">
                <td class="image-column"><img src="${imageInstance?.getShowImageUrl(Constants.thumbnailSize, Constants.thumbnailSize).url}"></td>
                <td class="name-column"><g:link action="show"
                                                id="${imageInstance.id}">${imageInstance.name}</g:link></td>
                <td class="desc-column">${imageInstance.description}</td>
                <td class="owner-column"><g:link controller="user" action="show"
                                                 id="${imageInstance.owner.id}">${imageInstance.owner}</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <g:if test="${imageTotal > 10}">
        <div class="pagination pull-right">
            <g:paginate total="${imageTotal ?: 0}"/>
        </div>
    </g:if>
</div>
</body>
</html>