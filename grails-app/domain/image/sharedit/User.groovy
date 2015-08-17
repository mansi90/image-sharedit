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
        UUID uuid = UUID.randomUUID()
        char[] uuidChars = uuid.toString().toCharArray()
        identificationKey = (uuidChars[0]..uuidChars[19]).join('')
    }

    @Override
    String toString (){
        return email
    }
}
