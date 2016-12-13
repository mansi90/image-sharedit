package image.sharedit

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'image', action: 'index')
        "/register"(controller: 'login', action: 'register')
        "/verifyAccount"(controller: 'login', action: 'confirm')
        "/gallery"(controller: 'image', action: 'gallery')
        "/profile"(controller: 'user', action: 'profile')
        "/dashboard"(controller: 'dashboard', action: 'index')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}