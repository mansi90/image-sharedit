package image.sharedit


import org.springframework.dao.DataIntegrityViolationException

class RoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [roleList: Role.list(params), roleTotal: Role.count()]
    }

    def create() {
        [role: new Role(params)]
    }

    def save() {
        def role = new Role(params)
        if (!role.save(flush: true)) {
            render(view: "create", model: [role: role])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Role'), role.id])
        redirect(action: "show", id: role.id)
    }

    def show(Long id) {
        def role = Role.get(id)
        if (!role) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        [role: role]
    }

    def edit(Long id) {
        def role = Role.get(id)
        if (!role) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        [role: role]
    }

    def update(Long id, Long version) {
        def role = Role.get(id)
        if (!role) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (role.version > version) {
                    role.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'role.label', default: 'Role')] as Object[],
                            "Another user has updated this Role while you were editing")
                render(view: "edit", model: [role: role])
                return
            }
        }

        role.properties = params

        if (!role.save(flush: true)) {
            render(view: "edit", model: [role: role])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'role.label', default: 'Role'), role.id])
        redirect(action: "show", id: role.id)
    }

    def delete(Long id) {
        def role = Role.get(id)
        if (!role) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
            return
        }

        try {
            role.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'role.label', default: 'Role'), id])
            redirect(action: "show", id: id)
        }
    }
}