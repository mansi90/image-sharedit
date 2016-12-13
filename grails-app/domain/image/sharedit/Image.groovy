package image.sharedit

class Image {
    String name
    String description
    Integer width
    Integer height
    String url
    Image parent = null

    static belongsTo = [owner: User, album: Album]

    static constraints = {
        parent nullable: true
    }

    static List<Image> fetchImagesForGallery(User currentUser) {
        List<Image> list = Image.findAllByParentIsNullAndOwner(currentUser)
        Collections.shuffle(list, new Random())
        return list
    }

    transient Map getShowImageUrl(int requestWidth, int requestedHeight) {
        Integer customizedWidth = this.width, customizedHeight = this.height
        if ((this.width > this.height) && (this.width >= requestWidth)) {
            customizedWidth = requestWidth
            customizedHeight = (Math.round((requestWidth * this.height) / this.width)).intValue()
        } else if (!(this.width > this.height) && (this.height >= requestedHeight)) {
            customizedWidth = (Math.round((requestedHeight * this.width) / this.height)).intValue()
            customizedHeight = requestedHeight
        }
        return getUrlForImageFitResize(customizedWidth, customizedHeight)
    }

    Map getUrlForImageFitResize(Integer width, Integer height) {
        return [url: (url?.replace("/upload/", "/upload/c_fit,w_${width},h_${height},f_auto/".toString())),
                width: width, height: height]
    }
}
