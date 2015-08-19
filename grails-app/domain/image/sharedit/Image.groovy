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


    transient def getShowImageUrl() {
        if (this.width >= Constants.showImageSize) {
            return getUrlForImageFitResize(Constants.showImageSize, (Math.round((Constants.showImageSize * this.height) / this.width)).intValue())
        } else {
            return getUrlForImageFitResize(this.width, this.height)
        }
    }

    def getUrlForImageFitResize(Integer width, Integer height) {
        return (url?.replace("/upload/", "/upload/c_fit,w_${width},h_${height},f_auto/".toString()))
    }
}
