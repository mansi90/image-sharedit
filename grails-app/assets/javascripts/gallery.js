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

        $(document).on('hidden.bs.modal', editImageModal, function () {
            $(editImageModal).find("#editor-window").html('<canvas id="example"></canvas>');
            $(editImageModal).find("#Filters").find('input[type=range]').each(function () {
                $(this).val(0);
                $(this).change();
            });
            $(editImageModal).find("#PresetFilters").find('a[data-preset]').each(function () {
                $(this).removeClass("Active")
            });
        });
    });

    function openImageEditorModal(imageUrl, width, height) {
        var img = document.createElement('img'), canvas = document.getElementById('example'), dataURL;
        canvas.width = width;
        canvas.height = height;
        $(editImageModal).modal('show');
        showSpinner($("#editor-window"));
        img.onload = function (e) {
            var ctx = canvas.getContext('2d');
            ctx.drawImage(img, 0, 0, width, height);
            $(canvas).attr('data-caman-hidpi', canvas.toDataURL());
            removeSpinner($("#editor-window"));
            $(document).trigger('_canvas_ready');
        };
        img.crossOrigin = ''; // no credentials flag. Same as img.crossOrigin='anonymous'
        img.width = (width > 800 ? 800 : width);
        img.height = (height > 800 ? 800 : height);
        img.src = imageUrl;
    }

    function showSpinner($parentDiv) {
        var spinner = new Spinner().spin();
        $parentDiv.append('<div class="spinner-overlay"></div>').append(spinner.el);
    }

    function removeSpinner($parentDiv) {
        $parentDiv.find('div.spinner').remove();
        $parentDiv.find('div.spinner-overlay').remove();
    }

    return{

    }
}());