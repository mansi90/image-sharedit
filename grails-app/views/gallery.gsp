<%@ page import="image.sharedit.Image" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Image Gallery</title>
    <asset:stylesheet src="login.css"/>
    <asset:stylesheet src="gallery.css"/>
</head>

<body>
<div class="codrops-top">
    <a href="/">
        <strong>« Image SharEdit</strong>
    </a>
</div>

<div id="gallery-main-section">
    <g:each in="${1..10}">
        <g:each in="${Image.list()}" var="imageInstance">
            <div class="image-section">
                <div class="image-inner-area">
                    <img src="${imageInstance.getShowImageUrl(140)}">
                </div>
            </div>
        </g:each>
    </g:each>
</div>
</body>
</html>