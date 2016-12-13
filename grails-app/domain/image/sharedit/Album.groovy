package image.sharedit

class Album {
    String name
    String description
    User owner

    static hasMany = [images: Image]

    static constraints = {
        owner nullable: false
        name nullable: false, blank: false
        description nullable: true, blank: false
    }
}