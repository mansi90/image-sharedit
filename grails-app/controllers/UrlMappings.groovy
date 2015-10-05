class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'image', action: 'index')
        "/gallery"(controller: 'image', action: 'gallery')
        "/profile"(controller: 'user', action: 'profile')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
