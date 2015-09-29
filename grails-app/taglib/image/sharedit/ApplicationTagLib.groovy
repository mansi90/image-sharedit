package image.sharedit

class ApplicationTagLib {
    static namespace = "custom"

    def truncatedString = { attr, body ->
        String str = attr.property
        Integer length = str.length(), max = Integer.parseInt(attr.max.toString())
        out << (((length) > max) ? (str.substring(0, max) + "<span style='color: #006400;font-weight: bold;font-style: italic;'>...</span>") : str)
    }

    def galleryImageTitle = { attr, body ->
        Image imageInstance = attr.imageInstance as Image
        Map imageDetails = imageInstance.getShowImageUrl(500, 445)
        String html = imageInstance.name + "<span class='editImageLink editBtn' data-imageurl='${imageDetails.url}' " +
                "data-width='${imageDetails.width}' data-height='${imageDetails.height}'>Edit</span>"
        out << html
    }
}
