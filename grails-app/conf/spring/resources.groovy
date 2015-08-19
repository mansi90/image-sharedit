import com.cloudinary.Cloudinary

// Place your Spring DSL code here
beans = {
    cloudinary(Cloudinary) { bean ->
        bean.constructorArgs = [[cloud_name: grailsApplication.config.cloudinary.cloudName, api_key: grailsApplication.config.cloudinary.apiKey, api_secret: grailsApplication.config.cloudinary.apiSecret, use_filename: true]]
    }
}
