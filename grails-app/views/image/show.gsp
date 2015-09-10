<%@ page import="image.sharedit.Constants" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-image" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list image">

        <li class="fieldcontain">
            <span id="name-label" class="property-label">Name</span>
            <div class="property-value" aria-labelledby="name-label">${image.name}</div>
        </li>

        <li class="fieldcontain">
            <span id="description-label" class="property-label">Description</span>
            <div class="property-value" aria-labelledby="description-label">${image.description}</div>
        </li>

        <li class="fieldcontain">
            <span id="owner-label" class="property-label">Owner</span>
            <div class="property-value" aria-labelledby="owner-label"><a href="${createLink(controller :'user', action :'show', id: image.owner.id)}">${image.owner}</a></div>
        </li>

        <li class="fieldcontain">
            <span id="url-label" class="property-label">Image</span>
            <div class="property-value" aria-labelledby="url-label">
                <img src="${image?.getShowImageUrl(Constants.showImageSize)}">
            </div>
        </li>
    </ol>
    
    <g:form action="delete" method="POST">
        <g:hiddenField name="id" value="${image.id}"/>
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.image}"><g:message code="default.button.edit.label"
                                                                                   default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
