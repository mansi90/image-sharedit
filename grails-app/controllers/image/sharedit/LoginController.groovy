package image.sharedit

class LoginController {
    UserService userService

    def index() {
        if(userService.getLoggedInUser(session)){
            redirect(uri: '/')
            return true
        }
    }

    def onSubmit() {
        User user = User.findByEmailAndPassword(params.email, params.password)
        if (user) {
            session.userIdentificationKey = user.identificationKey
            redirect(controller: 'image', action: 'index')
        } else {
            flash.message = "Invalid email password combination!"
            redirect(action: 'index')
        }
    }

    def onLogout(){
        session.invalidate()
        redirect(action: 'index')
        return true
    }

    def register(){}
}
