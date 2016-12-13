<%@ page import="image.sharedit.Image; image.sharedit.Album" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Dashboard</title>
    <asset:stylesheet src="theme.css"/>
    <asset:stylesheet src="dashboard.css"/>
</head>

<body>
<div class="codrops-top">
    <a href="/">
        <strong>« Image SharEdit</strong>
    </a>
</div>

<g:if test="${albumList}">
    <div id="album-container">
        <p id="main-title"><span>My Albums</span></p>
    </div>

    <div id="album-main-section">
        <g:if test="${flash.message}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">×</button>
                ${flash.message}
            </div>
        </g:if>
        <g:each in="${albumList as List<Album>}" var="albumInstance">
            <div class="album-tile">
                <div class="album-section">
                    <div class="album-inner-area">
                        <g:link controller="dashboard" action="albumDetail" id="${albumInstance.id}">
                            <img src="${Image.findByAlbum(albumInstance).getShowImageUrl(140, 140).url}">
                        </g:link>
                    </div>
                </div>

                <p class="title-section"><custom:truncatedString property="${albumInstance.name}" max="15"/></p>
            </div>
        </g:each>
    </div>
</g:if>

<span id="add-album-icon">
    <asset:image src="add-green-rounded-01-64.png"/>
</span>
</body>
</html>