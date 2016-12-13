package image.sharedit

import org.springframework.dao.DataIntegrityViolationException

class ClubController {
    def springSecurityService
    ClubService clubService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [clubList: Club.list(params), clubTotal: Club.count()]
    }

    def create() {
        [club: new Club(params)]
    }

    def save() {
        def club = new Club(params)
        club.owner = springSecurityService.currentUser as User

        if (!clubService.createOrUpdateClubMembers(club, params)) {
            render(view: "create", model: [club: club])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'club.label', default: 'Club'), club.id])
        redirect(action: "show", id: club.id)
    }

    def show(Long id) {
        def club = Club.get(id)
        if (!club) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'club.label', default: 'Club'), id])
            redirect(action: "list")
            return
        }

        [club: club]
    }

    def edit(Long id) {
        def club = Club.get(id)
        if (!club) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'club.label', default: 'Club'), id])
            redirect(action: "list")
            return
        }

        [club: club]
    }

    def update(Long id, Long version) {
        def club = Club.get(id)
        if (!club) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'club.label', default: 'Club'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (club.version > version) {
                club.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'club.label', default: 'Club')] as Object[],
                        "Another user has updated this Club while you were editing")
                render(view: "edit", model: [club: club])
                return
            }
        }

        club.properties = params

        if (!clubService.createOrUpdateClubMembers(club, params)) {
            render(view: "edit", model: [club: club])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'club.label', default: 'Club'), club.id])
        redirect(action: "show", id: club.id)
    }

    def delete(Long id) {
        def club = Club.get(id)
        if (!club) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'club.label', default: 'Club'), id])
            redirect(action: "list")
            return
        }

        try {
            club.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'club.label', default: 'Club'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'club.label', default: 'Club'), id])
            redirect(action: "show", id: id)
        }
    }
}