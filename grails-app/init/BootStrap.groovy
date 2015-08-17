import image.sharedit.User

class BootStrap {

    def init = { servletContext ->
        if (!User.count) {
            new User(firstName: 'Mansi', lastName: 'Arora', email: 'mansi.arora@tothenew.com', password: 'password').save(flush: true, failOnError: true)
            new User(firstName: 'Neha', lastName: 'Gupta', email: 'neha.gupta@tothenew.com', password: 'password').save(flush: true, failOnError: true)
        }
    }
    def destroy = {
    }
}
