<%=packageName%>
<% import grails.persistence.Event %>

<%  excludedProps = Event.allEvents.toList() << 'version' << 'dateCreated' << 'lastUpdated'
	persistentPropNames = className.persistentProperties*.name
    boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate') || pluginManager?.hasGrailsPlugin('hibernate4')
    if (hasHibernate) {
        def GrailsDomainBinder =
            getClass().classLoader.loadClass('org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsDomainBinder')
        if(GrailsDomainBinder.newInstance().getMapping(className)?.identity?.generator
            == 'assigned') {
             persistentPropNames << className.identifier.name
        }
    }
	props = className.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) }
	Collections.sort(props, comparator.constructors[0].newInstance([className] as Object[]))
	for (p in props) {
		if (p.embedded) {
			def embeddedPropNames = p.component.persistentProperties*.name
			def embeddedProps = p.component.properties.findAll { embeddedPropNames.contains(it.name) && !excludedProps.contains(it.name) }
			Collections.sort(embeddedProps, comparator.constructors[0].newInstance([p.component] as Object[]))
	%>
        <fieldset class="embedded">
            <legend><g:message code="${className.propertyName}.${p.name}.label" default="${p.naturalName}" /></legend>
            <%
				for (ep in p.component.properties) {
					renderFieldForProperty(ep, p.component, "${p.name}.")
				}
	        %>
        </fieldset>
    <%
        } else {
            renderFieldForProperty(p, className)
        }
	 }

private renderFieldForProperty(p, owningClass, prefix = "") {
	boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate')
	boolean display = true
	boolean required = false
	if (hasHibernate) {
		cp = owningClass.constrainedProperties[p.name]
		display = (cp ? cp.display : true)
		required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable && (cp.propertyType != String || !cp.blank) : false)
	}
	if (display) { %>
            <div class="control-group">
                <label class="control-label hidden-phone" for="${prefix}${p.name}">
                    <g:message code="${className.propertyName}.${prefix}${p.name}.label" default="${p.naturalName}" />
                    <% if (required) { %><span class="required-indicator">*</span><% } %>
                </label>
                <div class="controls">
                    ${renderEditor(p)}
                </div>
            </div>
<%
    }
}
%>
