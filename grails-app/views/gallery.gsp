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
    <asset:javascript src="gallery.js"/>

    <asset:stylesheet src="editor/bootstrap-image-editor.css"/>
    <asset:javascript src="editor/jquery-ui.js"/>
    <asset:javascript src="editor/caman.full.js"/>
    <asset:javascript src="editor/bootstrap-image-editor.min.js"/>
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
                        <img src="${imageInstance.getShowImageUrl(140)}">
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