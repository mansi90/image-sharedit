class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'image', action: 'index')
        "/logout"(controller: 'login', action: 'onLogout')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
