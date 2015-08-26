<%@ page import="image.sharedit.Image" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Image Gallery</title>
    <asset:stylesheet src="magnific-popup.css"/>
    <asset:stylesheet src="login.css"/>
    <asset:stylesheet src="gallery.css"/>
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:javascript src="jquery.magnific-popup.js"/>
    <asset:javascript src="gallery.js"/>
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
                       title="${imageInstance.description}">
                        <img src="${imageInstance.getShowImageUrl(140)}">
                    </a>
                </div>
            </div>

            <p class="title-section">${imageInstance.truncatedImageName(18)}</p>
        </div>
    </g:each>
</div>
</body>
</html>