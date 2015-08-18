package image.sharedit

import grails.transaction.Transactional

@Transactional
class UserService {

    User getLoggedInUser(def session) {
        String userIdentificationKey = session.userIdentificationKey.toString()
        (userIdentificationKey) ? User.findByIdentificationKey(userIdentificationKey) : null
    }
}
