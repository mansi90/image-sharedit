<%@ page import="image.sharedit.Image; image.sharedit.Album" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Album Details</title>
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:stylesheet src="theme.css"/>
    <asset:stylesheet src="albumDetails.css"/>
    <asset:stylesheet src="vendors/font-awesome.min.css"/>
    <asset:stylesheet src="vendors/jgallery.css"/>
    <asset:javascript src="vendors/jgallery.js"/>
</head>

<body>
<div class="codrops-top">
    <a href="/">
        <strong>« Image SharEdit</strong>
    </a>
</div>

<div id="album-container">
    <p id="main-title"><span>${albumInstance.name}</span></p>
</div>

<div id="album-main-section">

    <div id="gallery">
        <g:each in="${albumInstance.images}" var="imageInstance">
            <a href="${imageInstance.url}"><img src="${imageInstance.getShowImageUrl(140, 140).url}" alt="${imageInstance.name}" /></a>
        </g:each>
    </div>
</div>

<asset:javascript src="vendors/touchswipe.js"/>
<script type="text/javascript">
    $( function(){
        $( "#gallery" ).jGallery( {
            "transitionCols":"1",
            "transitionRows":"1",
            "thumbnailsPosition":"left",
            "thumbType":"image",
            "backgroundColor":"ffffff",
            "textColor":"000000",
            "mode":"standard"
        } );
    } );
</script>
</body>
</html>