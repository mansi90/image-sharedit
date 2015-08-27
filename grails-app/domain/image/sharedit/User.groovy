package image.sharedit

class User {
    String firstName
    String lastName
    String password
    String email
    String identificationKey = 'randomString'

    static hasMany = [images : Image]

    static constraints = {
        firstName(nullable: false, blank: false)
        lastName(nullable: false, blank: false)
        email blank: false, unique: true, email: true, nullable: false
        password blank: false, nullable: false
        identificationKey unique: false
    }

    def beforeInsert () {
        putIdentificationKey()
    }

    private void putIdentificationKey() {
        identificationKey = UUID.randomUUID().toString()
    }

    @Override
    String toString (){
        return email
    }
}
