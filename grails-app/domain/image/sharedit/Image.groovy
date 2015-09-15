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

    static List<Image> randomOrderedList() {
        List<Image> list = Image.list()
        Collections.shuffle(list, new Random())
        return list
    }

    transient Map getShowImageUrl(int requestedSize) {
        Integer customizedWidth = this.width, customizedHeight = this.height
        if ((this.width > this.height) && (this.width >= requestedSize)) {
            customizedWidth = requestedSize
            customizedHeight = (Math.round((requestedSize * this.height) / this.width)).intValue()
        } else if (!(this.width > this.height) && (this.height >= requestedSize)) {
            customizedWidth = (Math.round((requestedSize * this.width) / this.height)).intValue()
            customizedHeight = requestedSize
        }
        return getUrlForImageFitResize(customizedWidth, customizedHeight)
    }

    Map getUrlForImageFitResize(Integer width, Integer height) {
        return [url: (url?.replace("/upload/", "/upload/c_fit,w_${width},h_${height},f_auto/".toString())),
                width: width, height: height]
    }
}
