<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-user" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="username" title="Username"/>
            <g:sortableColumn property="email" title="Email"/>
            <g:sortableColumn property="firstName" title="First Name"/>
            <g:sortableColumn property="lastName" title="Last Name"/>
            <th>Roles</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userList}" status="i" var="userInstance">
            <tr class="${i % 2 == 0 ? "even" : "odd"}">
                <td>
                    <g:link action="show" id="${userInstance.id}">
                        ${fieldValue(bean: userInstance, field: "username")}
                    </g:link>
                </td>

                <td>${fieldValue(bean: userInstance, field: "email")}</td>

                <td>${fieldValue(bean: userInstance, field: "firstName")}</td>

                <td>${fieldValue(bean: userInstance, field: "lastName")}</td>

                <td>
                    <ul style="list-style-type: none">
                        <g:each in="${userInstance.authorities}" var="${role}">
                            <li><g:link controller="role" action="show" id="${role.id}">${role}</g:link></li>
                        </g:each>
                    </ul>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <g:if test="${userTotal > 10}">
        <div class="pagination pull-right">
            <g:paginate total="${userTotal ?: 0}"/>
        </div>
    </g:if>
</div>
</body>
</html>