package image.sharedit

class Club {
    String name
    User owner

    static constraints = {
        name (nullable: false, blank: false)
    }
}
