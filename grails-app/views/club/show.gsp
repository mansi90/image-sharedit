<%@ page import="image.sharedit.ClubMember" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'club.label', default: 'Club')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-club" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-club" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list club">

        <li class="fieldcontain">
            <span id="name-label" class="property-label">Name</span>

            <div class="property-value" aria-labelledby="name-label">Newers</div>
        </li>

        <li class="fieldcontain">
            <span id="owner-label" class="property-label">Owner</span>

            <div class="property-value" aria-labelledby="owner-label">
                <a href="${createLink(controller: 'user', action: 'show', id: this.club.owner.id)}">${this.club.owner}</a>
            </div>
        </li>
        <g:if test="${ClubMember.countByClub(this.club)}">
            <li class="fieldcontain">
                <span id="clubMembers-label" class="property-label">Club Members</span>

                <div class="property-value" aria-labelledby="clubMembers-label">
                    <g:each in="${ClubMember.findAllByClub(this.club)?.unique { it.user }}" var="clubMember">
                        <a href="${createLink(controller: 'user', action: 'show', id: clubMember.user.id)}">${clubMember.user}</a><br/>
                    </g:each>
                </div>
            </li>
        </g:if>
    </ol>

    <g:form action="delete" method="POST">
        <g:hiddenField name="id" value="${this.club?.id}"/>
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.club}"><g:message code="default.button.edit.label"
                                                                                  default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
