package image.sharedit

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional

@Transactional
class AlbumService {
    SpringSecurityService springSecurityService

    Album getEditedImagesAlbumForLoggedInUser() {
        Album album = null
        User currentUser = springSecurityService.currentUser as User
        if(currentUser){
            album = Album.findOrSaveByOwnerAndName(currentUser,Constants.EDITED_IMAGES_ALBUM_NAME)
        }

        return album
    }
}
