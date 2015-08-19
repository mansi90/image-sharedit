package image.sharedit

class Image {
    String name
    String description
    Integer width
    Integer height
    String url

    static belongsTo = [owner: User]

    static constraints = {
    }


    transient def getShowImageUrl(int requestedWidth) {
        if (this.width >= requestedWidth) {
            return getUrlForImageFitResize(requestedWidth, (Math.round((requestedWidth * this.height) / this.width)).intValue())
        } else {
            return getUrlForImageFitResize(this.width, this.height)
        }
    }

    def getUrlForImageFitResize(Integer width, Integer height) {
        return (url?.replace("/upload/", "/upload/c_fit,w_${width},h_${height},f_auto/".toString()))
    }
}
