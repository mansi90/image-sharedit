<fieldset class="form">
    <div class="fieldcontain required">
        <label for="name">Name
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="name" value="${album.name}" required="" class="width-300"/>
    </div>

    <div class="fieldcontain">
        <label for="description">Description</label>
        <g:textField name="description" value="${album.description}" class="width-300"/>
    </div>
</fieldset>