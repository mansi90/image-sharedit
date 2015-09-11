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
                        var url = $(this).data('imageurl');
                        $(editImageModal).find('.modal-body').append("<div id='editor-window'></div>");
                        $(editImageModal).find("#editor-window").imageEditor({
                            'source': url,
                            "onClose": function () {
                                $(editImageModal).find("#editor-window").remove();
                            }
                        });
                        $(editImageModal).modal('show');
                    });
                }
            }
        });
    });

    return{

    }
}());