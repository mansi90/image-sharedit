package image.sharedit

class Utils {

    static String getPublicId(String url) {
        if (!url || url.length() < 10) {
            return null
        }
        String publicIdDotExtension = url.split('/').last()
        List tokens = publicIdDotExtension.tokenize('.')
        return (tokens.first())
    }
}
