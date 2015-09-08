import image.sharedit.BootstrapService
import image.sharedit.Role
import image.sharedit.User

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
