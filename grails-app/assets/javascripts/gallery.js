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
                        $(editImageModal).modal('show');
                        var callbacks= {};
                        callbacks.success = function(data){
                            $("#render-image-editor").html(data);
                        };
                        callbacks.error = function(){
                            removeSpinner($("#render-image-editor"));
                        };
                        showSpinner($("#render-image-editor"));
                        ajax($(this).data('ajaxurl'), {}, callbacks);
                    });
                }
            }
        });

        $(document).on('hidden.bs.modal', editImageModal, function () {
            $(editImageModal).find("#render-image-editor").empty();
        });
    });

    function showSpinner($parentDiv) {
        var spinner = new Spinner().spin();
        $parentDiv.append('<div class="spinner-overlay"></div>').append(spinner.el);
    }

    function removeSpinner($parentDiv) {
        $parentDiv.find('div.spinner').remove();
        $parentDiv.find('div.spinner-overlay').remove();
    }

    function ajax (url, data, callbacks) {
        $.ajax({
            url: url,
            data: data,
            success: callbacks.success,
            error: callbacks.error
        });
    }

    return{

    }
}());