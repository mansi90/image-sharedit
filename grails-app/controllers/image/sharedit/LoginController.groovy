package image.sharedit

class LoginController {

    def index() {}

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
}
