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

    static List<Map> imageEffects() {
        return [
                [name: 'brightness', min: -100, max: 100, value: 0, step: 1],
                [name: 'contrast', min: -100, max: 100, value: 0, step: 1],
                [name: 'saturation', min: -100, max: 100, value: 0, step: 1],
                [name: 'vibrance', min: -100, max: 100, value: 0, step: 1],
                [name: 'exposure', min: -100, max: 100, value: 0, step: 1],
                [name: 'hue', min: 0, max: 100, value: 0, step: 1],
                [name: 'sepia', min: 0, max: 100, value: 0, step: 1],
                [name: 'gamma', min: 0, max: 10, value: 0, step: 0.1],
                [name: 'noise', min: 0, max: 100, value: 0, step: 1],
                [name: 'clip', min: 0, max: 100, value: 0, step: 1],
                [name: 'sharpen', min: 0, max: 100, value: 0, step: 1],
                [name: 'stackBlur', min: 0, max: 20, value: 0, step: 1]
        ]
    }

    static Map imageFilters() {
        return [vintage: 'Vintage', lomo: 'Lomo', clarity: 'Clarity', sinCity: 'Sin City', sunrise: 'Sunrise',
                crossProcess: 'Cross Process', orangePeel: 'Orange Peel', love: 'Love', grungy: 'Grungy',
                jarques: 'Jarques', pinhole: 'Pinhole', glowingSun: 'Glowing Sun', hazyDays: 'Hazy Days',
                herMajesty: 'Her Majesty', nostalgia: 'Nostalgia', hemingway: 'Hemingway', concentrate: 'Concentrate']
    }
}
