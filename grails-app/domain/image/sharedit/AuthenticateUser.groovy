package image.sharedit

class AuthenticateUser {
    User user
    String token

    static constraints = {
        user(nullable: false, blank: false, unique: true)
        token(nullable: false, blank: false)
    }
}
