package image.sharedit

import org.apache.commons.codec.binary.Base64
import org.springframework.dao.DataIntegrityViolationException

class ImageController {
    ImageService imageService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [imageList: Image.list(params), imageTotal: Image.count()]
    }

    def create() {
        [image: new Image(params)]
    }

    def save() {
        def image = new Image(params)
        image.owner = springSecurityService.currentUser as User
        image = imageService.uploadImageToCloudinary(image, params.file)

        if (image.validate() && image.hasErrors()) {
            render(view: "create", model: [image: image])
            return
        }

        image.save(flush: true)

        flash.message = message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), image.id])
        redirect(action: "show", id: image.id)
    }

    def show(Long id) {
        def image = Image.get(id)
        if (!image) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
            return
        }

        [image: image]
    }

    def edit(Long id) {
        def image = Image.get(id)
        if (!image) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
            return
        }

        [image: image]
    }

    def update(Long id, Long version) {
        def image = Image.get(id)
        if (!image) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (image.version > version) {
                image.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'image.label', default: 'Image')] as Object[],
                        "Another user has updated this Image while you were editing")
                render(view: "edit", model: [image: image])
                return
            }
        }

        image.properties = params

        if (!image.save(flush: true)) {
            render(view: "edit", model: [image: image])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'image.label', default: 'Image'), image.id])
        redirect(action: "show", id: image.id)
    }

    def delete(Long id) {
        def image = Image.get(id)
        if (!image) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
            return
        }

        try {
            image.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "show", id: id)
        }
    }
}