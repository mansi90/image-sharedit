<%@ page import="image.sharedit.Image" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Image Gallery</title>
    <asset:stylesheet src="gallery.css"/>
</head>

<body>
<div style="max-width: 1024px; margin: auto">
    <g:each in="${1..10}">
        <g:each in="${Image.list()}" var="imageInstance">
            <div class="image-section">
                <div class="image-inner-area">
                    <img src="${imageInstance.getShowImageUrl(150)}">
                </div>
            </div>
        </g:each>
    </g:each>
</div>
</body>
</html>