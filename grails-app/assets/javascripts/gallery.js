var galleryFunctionality;
galleryFunctionality = (function () {
    var $document = $(document),
        editImageModal = '#image-editor-main-section #edit-image-modal',
        editImageModalBody = editImageModal +' .modal-body',
        resetEffectsBtn = '#buttons #resetBtn',
        saveBtn = '#buttons #saveBtn',
        editorDetails;

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
                        editorDetails = $(this).data();
                        openImageEditorModal();
                    });
                }
            }
        });

        $(document).on('hidden.bs.modal', editImageModal, function () {
            $(editImageModal).find("#editor-window").html('<canvas id="editImage" class="editorCanvas"></canvas>');
            $(editImageModal).find("#original-size").html('<canvas id="editOriginalImage" class="editorCanvas"></canvas>');
            $(editImageModal).find("#Filters").find('input[type=range]').each(function () {
                $(this).val(0);
                $(this).change();
            });
            $(editImageModal).find('#PresetFilters .vert .simply-scroll-list li').each(function () {
                $(this).removeClass("activeLi")
            });
            $(resetEffectsBtn).addClass('disabled');
            $(saveBtn).addClass('disabled');
        });

        $(document).on('click', '#PresetFilters .vert .simply-scroll-list li a', function () {
            removeSelected();
            $(this).closest('li').addClass('activeLi');
            $(resetEffectsBtn).removeClass('disabled');
            $(saveBtn).removeClass('disabled');
        });

        $(document).on('click', resetEffectsBtn, function () {
            if (!$(this).hasClass('disabled')) {
                removeSelected();
                openImageEditorModal();
                $(resetEffectsBtn).addClass('disabled');
                $(saveBtn).addClass('disabled');
            }
        });

        $(document).on('click', saveBtn, function () {
            if (!$(this).hasClass('disabled')) {
                saveImage();
            }
        });

        $(document).on('click', '#PresetFilters a[data-preset]', function () {
            var effectName = $(this).data('preset'), canvas1 = '#editImage', canvas2 = '#editOriginalImage';
            applyEffects(effectName, canvas1);
            applyEffects(effectName, canvas2);
        });
    });

    function applyEffectsToDemoImages(){
        $('#PresetFilters  a[data-preset] img.demoEffectImg').each(function(){
            applyEffects($(this).closest('a').data('preset'), '#'+$(this).attr('id'));
        });
    }

    function removeSelected() {
        $('#PresetFilters .vert .simply-scroll-list li.activeLi').each(function () {
            $(this).removeClass('activeLi');
        });
    }

    function saveImage() {
        var dataUrl = document.getElementById('editImage').toDataURL();
        var url = $(saveBtn).data('ajaxurl'), data = {parentId: editorDetails.imageid, imageDataUrl: dataUrl},
            callbacks = {};
        showSpinner($(editImageModal));
        callbacks.success = function (data) {
            window.location.reload();
        };
        callbacks.error = function (data) {
            removeSpinner($(editImageModal));
        };
        makeAjax(url, 'post', data, callbacks);
    }

    function openImageEditorModal() {
        $(editImageModal).modal('show');
        showSpinner($("#editor-window"));
        generateCanvas(editorDetails.resizedimageurl, 'editImage', editorDetails.resizedwidth, editorDetails.resizedheight);
    }

    function generateCanvas(url, canvasId, w, h) {
        var img = document.createElement('img'), canvas = document.getElementById(canvasId);
        canvas.width = w;
        canvas.height = h;
        img.onload = function (e) {
            var ctx = canvas.getContext('2d');
            ctx.drawImage(img, 0, 0, w, h);
            $(canvas).attr('data-caman-hidpi', canvas.toDataURL());
            if ((canvasId == 'editImage')) {
                generateCanvas(editorDetails.imageurl, 'editOriginalImage', editorDetails.width, editorDetails.height);
                removeSpinner($("#editor-window"));
                $(document).trigger('_canvas_ready');
            }
        };
        img.crossOrigin = ''; // no credentials flag. Same as img.crossOrigin='anonymous'
        img.width = w;
        img.height = h;
        img.src = url;
    }

    function showSpinner($parentDiv) {
        var spinner = new Spinner().spin();
        $parentDiv.append('<div class="spinner-overlay"></div>').append(spinner.el);
    }

    function removeSpinner($parentDiv) {
        $parentDiv.find('div.spinner').remove();
        $parentDiv.find('div.spinner-overlay').remove();
    }

    function makeAjax(url, type, data, callbacks) {
        $.ajax({
            type: type,
            url: url,
            cache: false,
            data: data,
            success: callbacks.success,
            error: callbacks.error
        });
    }

    function applyEffects(effectName, canvasId) {
        showSpinner($(editImageModalBody));
        Caman(canvasId, function () {
            this.reset();
            switch (effectName) {
                case 'vintage' :
                    this.vintage();
                    break;
                case 'lomo' :
                    this.lomo();
                    break;
                case 'clarity' :
                    this.clarity();
                    break;
                case 'sinCity' :
                    this.sinCity();
                    break;
                case 'sunrise' :
                    this.sunrise();
                    break;
                case 'crossProcess' :
                    this.crossProcess();
                    break;
                case 'orangePeel' :
                    this.orangePeel();
                    break;
                case 'love' :
                    this.love();
                    break;
                case 'grungy' :
                    this.grungy();
                    break;
                case 'jarques' :
                    this.jarques();
                    break;
                case 'pinhole' :
                    this.pinhole();
                    break;
                case 'glowingSun' :
                    this.glowingSun();
                    break;
                case 'hazyDays' :
                    this.hazyDays();
                    break;
                case 'herMajesty' :
                    this.herMajesty();
                    break;
                case 'nostalgia' :
                    this.nostalgia();
                    break;
                case 'hemingway' :
                    this.hemingway();
                    break;
                case 'concentrate' :
                    this.concentrate();
                    break;
            }
            this.render(function(){
                removeSpinner($(editImageModalBody));
            });
        });
    }

    return{
        applySimplyScroll: function () {
            applyEffectsToDemoImages();
            $("#scroller").simplyScroll({
                customClass: 'vert',
                orientation: 'vertical',
                auto: false,
                frameRate: 20,
                speed: 3
            });
        }
    }
}());