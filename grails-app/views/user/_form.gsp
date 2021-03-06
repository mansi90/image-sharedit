<%@ page import="image.sharedit.Role" %>
<div class="fieldcontain required">
    <label for="firstName">First Name<span class="required-indicator">*</span></label>
    <g:field type="text" name="firstName" value="${userInstance?.firstName}" required=""/>
</div>

<div class="fieldcontain required">
    <label for="lastName">Last Name
        <span class="required-indicator">*</span>
    </label>
    <g:field type="text" name="lastName" value="${userInstance?.lastName}" required=""/>
</div>

<div class="fieldcontain required">
    <label for="username">Username
        <span class="required-indicator">*</span>
    </label>
    <g:field type="text" name="username" value="${userInstance?.username}" required=""/>
</div>

<div class="fieldcontain required">
    <label for="email">Email
        <span class="required-indicator">*</span>
    </label>
    <g:field type="text" name="email" value="${userInstance?.email}" required=""/>
</div>

<div class="fieldcontain required">
    <label for="password">Password
        <span class="required-indicator">*</span>
    </label>
    <g:field type="password" name="password" value="" required=""/>
</div>

<div class="fieldcontain">
    <label for="roles">Roles<span class="required-indicator">*</span></label>

    <g:select name="roles" from="${Role.list()}" style="height: auto!important;"
              value="${userInstance?.id ? userInstance?.authorities : Role.findByAuthority("ROLE_USER")}"
              required="" multiple="true" class="select-box"/>
</div>

<div class="fieldcontain">
    <label for="accountExpired">Account Expired</label>
    <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}"/>
</div>

<div class="fieldcontain">
    <label for="accountLocked">Account Locked</label>
    <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}"/>
</div>

<div class="fieldcontain">
    <label for="enabled">Enabled</label>
    <g:checkBox name="enabled" value="${userInstance?.enabled}"/>
</div>

<div class="fieldcontain">
    <label for="passwordExpired">Password Expired</label>
    <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}"/>
</div>