<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-album" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-album" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <ol class="property-list album">

        <li class="fieldcontain">
            <span id="owner-label" class="property-label">Owner</span>

            <div class="property-value" aria-labelledby="owner-label">
                <a href="${createLink(controller: 'user', action: 'show', id: this.album.owner.id)}">${this.album.owner}</a>
            </div>
        </li>

        <li class="fieldcontain">
            <span id="name-label" class="property-label">Name</span>

            <div class="property-value" aria-labelledby="name-label">${this.album.name}</div>
        </li>

        <li class="fieldcontain">
            <span id="description-label" class="property-label">Description</span>

            <div class="property-value" aria-labelledby="description-label">${this.album.description}</div>
        </li>

        <g:if test="${this.album.images}">
            <li class="fieldcontain">
                <span id="images-label" class="property-label">Images</span>
                <div class="property-value" aria-labelledby="images-label">
                    <g:each in="${this.album.images}" var="imageInstance">
                        <a href="${createLink(controller: 'image', action: 'show', id: imageInstance.id)}">${imageInstance.name}</a><br/>
                    </g:each>
                </div>
            </li>
        </g:if>
    </ol>
    <g:form action="delete" method="POST">
        <g:hiddenField name="id" value="${this.album?.id}"/>
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.album}"><g:message code="default.button.edit.label"
                                                                                   default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
