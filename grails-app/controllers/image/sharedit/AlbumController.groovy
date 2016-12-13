package image.sharedit

import org.springframework.dao.DataIntegrityViolationException

class AlbumController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [albumList: Album.list(params), albumTotal: Album.count()]
    }

    def create() {
        [album: new Album(params)]
    }

    def save() {
        def album = new Album(params)
        album.owner = springSecurityService.currentUser as User

        if (!album.save(flush: true)) {
            render(view: "create", model: [album: album])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'album.label', default: 'Album'), album.id])
        redirect(action: "show", id: album.id)
    }

    def show(Long id) {
        def album = Album.get(id)
        if (!album) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), id])
            redirect(action: "list")
            return
        }

        [album: album]
    }

    def edit(Long id) {
        def album = Album.get(id)
        if (!album) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), id])
            redirect(action: "list")
            return
        }

        [album: album]
    }

    def update(Long id, Long version) {
        def album = Album.get(id)
        if (!album) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (album.version > version) {
                album.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'album.label', default: 'Album')] as Object[],
                        "Another user has updated this Album while you were editing")
                render(view: "edit", model: [album: album])
                return
            }
        }

        album.properties = params

        if (!album.save(flush: true)) {
            render(view: "edit", model: [album: album])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'album.label', default: 'Album'), album.id])
        redirect(action: "show", id: album.id)
    }

    def delete(Long id) {
        def album = Album.get(id)
        if (!album) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), id])
            redirect(action: "list")
            return
        }

        try {
            album.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'album.label', default: 'Album'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'album.label', default: 'Album'), id])
            redirect(action: "show", id: id)
        }
    }
}