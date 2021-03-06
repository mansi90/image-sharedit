package image.sharedit

class UserController {
    UserService userService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userList: User.list(params), userTotal: User.count()]
    }

    def profile() {
        [currentUser: springSecurityService.currentUser as User]
    }

    def create() {
        [user: new User(params)]
    }

    def save() {
        def user = new User(params)
        if (user.validate() && user.hasErrors()) {
            render(view: "create", model: [user: user])
            return
        }

        userService.saveUserAndItsRole(user, params.roles)

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect(action: "show", id: user.id)
    }

    def show(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [user: user]
    }

    def edit(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [user: user]
    }

    def update(Long id, Long version) {
        def user = User.get(id)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (user.version > version) {
                user.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'user.label', default: 'User')] as Object[],
                        "Another user has updated this User while you were editing")
                render(view: "edit", model: [user: user])
                return
            }
        }

        user.properties = params

        if (user.validate() && user.hasErrors()) {
            render(view: "edit", model: [user: user])
            return
        }

        userService.saveUserAndItsRole(user, params.roles)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect(action: "show", id: user.id)
    }

    def delete(Long id) {
        def user = User.get(id)

        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        flash.message = userService.deleteUser(user)
        redirect(action: 'list')
    }
}