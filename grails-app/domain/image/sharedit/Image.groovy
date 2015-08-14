package image.sharedit

class Image {
    Integer width
    Integer height
    String path

    static belongsTo = [owner: User]

    static constraints = {
    }
}
