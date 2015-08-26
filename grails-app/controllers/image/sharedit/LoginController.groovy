package image.sharedit

import grails.transaction.Transactional

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

    @Transactional
    def onRegister(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view: 'register'
            return
        }

        user.save flush: true

        flash.message = 'Your account has been successfully created'
        redirect action: 'index'
    }
}
