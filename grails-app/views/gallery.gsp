<%@ page import="image.sharedit.Image" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Image Gallery</title>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="magnific-popup.css"/>
    <asset:stylesheet src="theme.css"/>
    <asset:stylesheet src="image/gallery.css"/>
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="jquery.magnific-popup.js"/>
    <asset:javascript src="spin.min.js"/>

    <asset:stylesheet src="caman-example.css"/>
    <asset:javascript src="caman-example.js"/>
    <asset:javascript src="gallery.js"/>

    %{--<asset:stylesheet src="editor/bootstrap-image-editor.css"/>--}%
    %{--<asset:javascript src="editor/jquery-ui.js"/>--}%
    %{--<asset:javascript src="editor/caman.full.js"/>--}%
    %{--<asset:javascript src="editor/bootstrap-image-editor.min.js"/>--}%
</head>

<body>
<div class="codrops-top">
    <a href="/">
        <strong>« Image SharEdit</strong>
    </a>
</div>

<div id="gallery-main-section">
    <g:each in="${Image.randomOrderedList()}" var="imageInstance">
        <div class="image-tile">
            <div class="image-section">
                <div class="image-inner-area">
                    <a class="image-popup-vertical-fit" href="${imageInstance.url}"
                       title="${custom.galleryImageTitle(imageInstance: imageInstance)}">
                        <img src="${imageInstance.getShowImageUrl(140).url}">
                    </a>
                </div>
            </div>

            <p class="title-section"><custom:truncatedString property="${imageInstance.name}" max="18"/></p>
        </div>
    </g:each>
</div>

<div id="image-editor-main-section">
    <div class="modal fade" id="edit-image-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-body">
                    <div class="modal-heading">
                        <i aria-hidden="true" data-dismiss="modal" class="cancel-icon" type="button"></i>
                        <h3>Edit Image</h3>
                        <div id="Filters">

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>brightness</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="-100" max="100" step="1" value="0" data-filter="brightness">
                                    <span class="FilterValue">39</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>contrast</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="-100" max="100" step="1" value="0" data-filter="contrast">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>saturation</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="-100" max="100" step="1" value="0" data-filter="saturation">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>vibrance</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="-100" max="100" step="1" value="0" data-filter="vibrance">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>exposure</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="-100" max="100" step="1" value="0" data-filter="exposure">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>hue</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="0" max="100" step="1" value="0" data-filter="hue">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>sepia</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="0" max="100" step="1" value="0" data-filter="sepia">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>gamma</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="0" max="10" step="0.1" value="0" data-filter="gamma">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>noise</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="0" max="100" step="1" value="0" data-filter="noise">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>clip</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="0" max="100" step="1" value="0" data-filter="clip">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>sharpen</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="0" max="100" step="1" value="0" data-filter="sharpen">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>

                            <div class="Filter">
                                <div class="FilterName">
                                    <p>stackBlur</p>
                                </div>

                                <div class="FilterSetting">
                                    <input type="range" min="0" max="20" step="1" value="0" data-filter="stackBlur">
                                    <span class="FilterValue">0</span>
                                </div>
                            </div>


                            <div class="Clear"></div>

                            <div id="PresetFilters">

                                <a data-preset="vintage" class="">Vintage</a>

                                <a data-preset="lomo" class="">Lomo</a>

                                <a data-preset="clarity" class="">Clarity</a>

                                <a data-preset="sinCity" class="">Sin City</a>

                                <a data-preset="sunrise" class="">Sunrise</a>

                                <a data-preset="crossProcess" class="">Cross Process</a>

                                <a data-preset="orangePeel" class="">Orange Peel</a>

                                <a data-preset="love" class="">Love</a>

                                <a data-preset="grungy" class="">Grungy</a>

                                <a data-preset="jarques" class="">Jarques</a>

                                <a data-preset="pinhole" class="">Pinhole</a>

                                <a data-preset="oldBoot" class="">Old Boot</a>

                                <a data-preset="glowingSun" class="">Glowing Sun</a>

                                <a data-preset="hazyDays" class="">Hazy Days</a>

                                <a data-preset="herMajesty" class="">Her Majesty</a>

                                <a data-preset="nostalgia">Nostalgia</a>

                                <a data-preset="hemingway">Hemingway</a>

                                <a data-preset="concentrate">Concentrate</a>

                            </div>
                    </div>
                </div>

                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>