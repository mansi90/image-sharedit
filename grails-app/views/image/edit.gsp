<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="edit-image" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.image}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.image}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form name="imageForm" action="update" method="POST">
        <g:hiddenField name="id" value="${image.id}"/>
        <g:hiddenField name="version" value="${image.version}"/>

        <fieldset class="form">
            <div class="fieldcontain required">
                <label for="name">Name
                    <span class="required-indicator">*</span>
                </label><input type="text" id="name" name="name" value="${image.name}">
            </div>

            <div class="fieldcontain required">
                <label for="description">Description
                    <span class="required-indicator">*</span>
                </label><input type="text" id="description" name="description" value="${image.description}">
            </div>

        </fieldset>

        <div class="clearfix" style="min-height: 30px;"></div>

        <fieldset class="buttons">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
