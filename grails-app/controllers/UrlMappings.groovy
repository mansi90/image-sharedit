class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'image', action: 'index')
        "/gallery"(view: '/gallery')
        "/profile"(controller: 'user', action: 'profile')
        "/logout"(controller: 'login', action: 'onLogout')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
