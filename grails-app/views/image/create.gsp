<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-image" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
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
    <g:form action="save">
        <fieldset class="form">
            <div class="fieldcontain required">
                <label for="name">Name
                    <span class="required-indicator">*</span>
                </label><input type="text" name="name" value="" required="" id="name">
            </div>

            <div class="fieldcontain required">
                <label for="description">Description
                    <span class="required-indicator">*</span>
                </label><input type="text" name="description" value="" required="" id="description">
            </div>

            <div class="fieldcontain required">
                <label for="owner">Owner
                    <span class="required-indicator">*</span>
                </label>
                <select name="owner.id" required="" id="owner">
                <option value="1">mansi.arora@tothenew.com</option>
                <option value="2">neha.gupta@tothenew.com</option>
            </select>
            </div>

            <div class="fieldcontain required">
                <label for="url">Url
                    <span class="required-indicator">*</span>
                </label><input type="text" name="url" value="" required="" id="url">
            </div>

            <div class="fieldcontain required">
                <label for="width">Width
                    <span class="required-indicator">*</span>
                </label><input type="number" name="width" value="" required="" id="width">
            </div>

            <div class="fieldcontain required">
                <label for="height">Height
                    <span class="required-indicator">*</span>
                </label><input type="number" name="height" value="" required="" id="height">
            </div>
        </fieldset>

        <div class="clearfix" style="min-height: 30px;"></div>

        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
