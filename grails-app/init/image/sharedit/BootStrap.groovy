package image.sharedit

import image.sharedit.BootstrapService

class BootStrap {
    BootstrapService bootstrapService

    def init = { servletContext ->
        if (!Role.count) {
            bootstrapService.createRoles()
        }
        if (!User.count) {
            bootstrapService.createUsers()
        }
    }
    def destroy = {
    }
}
