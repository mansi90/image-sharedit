var galleryFunctionality;
galleryFunctionality = (function () {
    var $document = $(document),
        editImageModal = '#image-editor-main-section #edit-image-modal';

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
                    $('.editImageLink').click(function () {
                        openImageEditorModal($(this).data('imageurl'), $(this).data('width'), $(this).data('height'));
                    });
                }
            }
        });

        $(document).on('hidden.bs.modal', editImageModal, function(){
            $(editImageModal).find("#editor-window").remove();
        });
    });

    function openImageEditorModal(imageUrl, width, height) {
        var img = document.createElement('img'), canvas = document.createElement('canvas'), dataURL;
        canvas.width = width;
        canvas.height = height;
        $(editImageModal).find('.modal-body').append("<div id='editor-window'></div>");
        $(editImageModal).modal('show');
        showSpinner($("#editor-window"));
        img.onload = function (e) {
            var ctx = canvas.getContext('2d');
            ctx.drawImage(img, 0, 0, width, height);
            dataURL = canvas.toDataURL(); // Read succeeds, canvas won't be dirty.
            $(editImageModal).find("#editor-window").imageEditor({
                'source': dataURL,
                width: (width > 800 ? 800 : width),
                height: (height > 800 ? 800 : height),
                "onClose": function () {
                    $(editImageModal).find(".cancel-icon").click();
                }
            });
            removeSpinner($("#editor-window"));
        };
        img.crossOrigin = ''; // no credentials flag. Same as img.crossOrigin='anonymous'
        img.src = imageUrl;
    }

    function showSpinner  ($parentDiv) {
        var spinner = new Spinner().spin();
        $parentDiv.append('<div class="spinner-overlay"></div>').append(spinner.el);
    }

    function removeSpinner ($parentDiv) {
        $parentDiv.find('div.spinner').remove();
        $parentDiv.find('div.spinner-overlay').remove();
    };

    return{

    }
}());