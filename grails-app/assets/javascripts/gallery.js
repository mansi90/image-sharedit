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
            $(editImageModal).find("#editor-window").html('<canvas id="editImage"></canvas>');
            $(editImageModal).find("#Filters").find('input[type=range]').each(function () {
                $(this).val(0);
                $(this).change();
            });
            $(editImageModal).find('#PresetFilters .vert .simply-scroll-list li').each(function () {
                $(this).removeClass("activeLi")
            });
        });

        $(document).on('click', '#PresetFilters .vert .simply-scroll-list li a', function () {
            $('#PresetFilters .vert .simply-scroll-list li.activeLi').each(function () {
                $(this).removeClass('activeLi')
            });
            $(this).closest('li').addClass('activeLi')
        });
    });

    function openImageEditorModal(imageUrl, width, height) {
        var img = document.createElement('img'), canvas = document.getElementById('editImage'), dataURL;
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
        img.width = width;
        img.height = height;
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

    function applyEffectsToDemoImages(){
        Caman('#vintageImage', function () {
            this.vintage();
            this.render();
        });

        Caman('#lomoImage', function () {
            this.lomo();
            this.render();
        });

        Caman('#clarityImage', function () {
            this.clarity();
            this.render();
        });

        Caman('#sinCityImage', function () {
            this.sinCity();
            this.render();
        });

        Caman('#sunriseImage', function () {
            this.sunrise();
            this.render();
        });

        Caman('#crossProcessImage', function () {
            this.crossProcess();
            this.render();
        });

        Caman('#orangePeelImage', function () {
            this.orangePeel();
            this.render();
        });

        Caman('#loveImage', function () {
            this.love();
            this.render();
        });

        Caman('#grungyImage', function () {
            this.grungy();
            this.render();
        });

        Caman('#jarquesImage', function () {
            this.jarques();
            this.render();
        });

        Caman('#pinholeImage', function () {
            this.pinhole();
            this.render();
        });

        Caman('#glowingSunImage', function () {
            this.glowingSun();
            this.render();
        });

        Caman('#hazyDaysImage', function () {
            this.hazyDays();
            this.render();
        });

        Caman('#herMajestyImage', function () {
            this.herMajesty();
            this.render();
        });

        Caman('#nostalgiaImage', function () {
            this.nostalgia();
            this.render();
        });

        Caman('#hemingwayImage', function () {
            this.hemingway();
            this.render();
        });

        Caman('#concentrateImage', function () {
            this.concentrate();
            this.render();
        });
    }
    return{
        applySimplyScroll: function () {
            applyEffectsToDemoImages();
            $("#scroller").simplyScroll({
                customClass: 'vert',
                orientation: 'vertical',
                auto: false,
                manualMode: 'loop',
                frameRate: 50,
                speed: 5
            });
        }
    }
}());