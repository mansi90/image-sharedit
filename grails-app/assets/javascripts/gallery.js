var galleryFunctionality;
galleryFunctionality = (function () {
    var $document = $(document);

    $document.ready(function () {
        $('.image-popup-vertical-fit').magnificPopup({
            type: 'image',
            closeOnContentClick: true,
            mainClass: 'mfp-img-mobile',
            gallery: {
                enabled: true
            },
            image: {
                verticalFit: true
            }
        });
    });

    return{

    }
}());