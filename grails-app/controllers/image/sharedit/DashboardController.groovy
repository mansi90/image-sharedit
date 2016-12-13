package image.sharedit

class DashboardController {
    def springSecurityService

    def index() {
        User currentUser = springSecurityService.currentUser as User
        List<Album> albumList = Album.findAllByOwner(currentUser)

        [albumList: albumList]
    }

    def albumDetail(Long id) {
        Album albumInstance = Album.get(id)
        [albumInstance : albumInstance]
    }
}
