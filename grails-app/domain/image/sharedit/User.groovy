package image.sharedit

class User {
    String firstName
    String lastName
    String password
    String email

    static hasMany = [images : Image]

    static constraints = {
        firstName(nullable: false, blank: false)
        lastName(nullable: false, blank: false)
        email blank: false, unique: true, email: true, nullable: false
        password blank: false, nullable: false
    }
}
