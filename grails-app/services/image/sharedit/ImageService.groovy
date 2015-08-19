package image.sharedit

import grails.transaction.Transactional

@Transactional
class ImageService {
    def cloudinary

    File multipartToFile(def multipartFile) throws IllegalStateException, IOException {
        File convertedFile = new File("/tmp/${multipartFile.getOriginalFilename()}");
        convertedFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convertedFile);
        fos.write(multipartFile.getBytes());
        fos.close();

        return convertedFile;
    }

    Image uploadImageToCloudinary(Image image, def file){
        if (file) {
            File myFile = multipartToFile(file)
            Map returnedData = cloudinary.uploader().upload(myFile, cloudinary.config)
            image.url = returnedData.secure_url
            image.width = returnedData.width
            image.height = returnedData.height
        }

        return image
    }
}
