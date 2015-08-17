import image.sharedit.User

class ApplicationInterceptor {

    ApplicationInterceptor() {
        matchAll().excludes(controller: "login")
    }

    boolean before() {
        println("Log.Info ----------- controller : ${params.controller} ------ action : ${params.action}")
        if (session.userIdentificationKey) {
            User user = User.findByIdentificationKey(session.userIdentificationKey)
            if (user) {
                request.currentUser = user
            } else {
                flash.message = "User does not exist, please login..."
                redirect(controller: 'login', action: 'index')
                return true
            }
        } else{
            redirect(controller: 'login', action: 'index')
            return true
        }

        return true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }

}
