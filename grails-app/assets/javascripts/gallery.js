var galleryFunctionality;
galleryFunctionality = (function () {
    var $document = $(document),
        editImageModal= '#image-editor-main-section #edit-image-modal';

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
            },
            callbacks: {
                open: function () {
                    $('.editImageLink').click(function(){
                        console.log('clicked');
                        $(editImageModal).modal('show');
                        console.log('after');
                    });

                    /*$("#editor-window").imageEditor({
                     'source': $span.data('imageurl'),
                     //               "maxWidth": 500,
                     "onClose": function () {
                     }
                     });*/
                }
            }
        });
    });

    return{

    }
}());