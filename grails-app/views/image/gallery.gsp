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
    <asset:stylesheet src="jquery.simplyscroll.css"/>
    <asset:javascript src="jquery.simplyscroll.js"/>
    <asset:stylesheet src="editor/custom-caman.css"/>
    <asset:javascript src="editor/caman.full.js"/>
    <asset:javascript src="gallery.js"/>
</head>

<body>
<div class="codrops-top">
    <a href="/">
        <strong>« Image SharEdit</strong>
    </a>
</div>

<g:if test="${galleryItems}">
    <div id="gallery-main-section">
        <g:if test="${flash.message}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">×</button>
                ${flash.message}
            </div>
        </g:if>
        <g:each in="${galleryItems}" var="imageInstance">
            <div class="image-tile">
                <div class="image-section">
                    <div class="image-inner-area">
                        <a class="image-popup-vertical-fit" href="${imageInstance.url}"
                           title="${custom.galleryImageTitle(imageInstance: imageInstance)}">
                            <img src="${imageInstance.getShowImageUrl(140, 140).url}">
                        </a>
                    </div>
                </div>

                <p class="title-section"><custom:truncatedString property="${imageInstance.name}" max="15"/></p>
            </div>
        </g:each>
    </div>

    <div id="image-editor-main-section">
        <div class="modal fade" id="edit-image-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-body">
                        <div class="modal-heading">
                            <h3>Edit Image</h3>
                            <i aria-hidden="true" data-dismiss="modal" class="cancel-icon" type="button"></i>
                        </div>

                        <g:render template="/image/imageEditor"/>

                    </div>

                    <div class="modal-footer">
                        <div id="buttons">
                            <a id="resetBtn" href="javascript:void(0)" class="btn btn-primary disabled left">RESET</a>
                            <a id="saveBtn" href="javascript:void(0)" class="btn btn-primary disabled right"
                               data-ajaxurl="${createLink(controller: 'image', action: 'saveEditedImage')}">SAVE</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:if>
<g:else>
    <div id="gallery-main-section" class="text-center text-muted">No images found.</div>
</g:else>
</body>
</html>