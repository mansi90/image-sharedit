<%@ page import="image.sharedit.Utils" %>
<div id="PresetFilters">
    <ul id="scroller">
        <g:each in="${Utils.imageEffects()}">
            <li>
                <a data-preset="${it.key}">
                    <asset:image id="${it.key}Image" src="scenery-150X94.jpg" class="demoEffectImg"/>
                    <p style="text-align: center">${it.value}</p>
                </a>
                <span></span>
            </li>
        </g:each>
    </ul>
</div>

<div id="Filters" style="display: none;">
    <g:each in="${Utils.imageFilters()}" var="filterDetail">
        <div class="Filter">
            <div class="FilterName">
                <p>${filterDetail.name}</p>
            </div>

            <div class="FilterSetting">
                <input type="range" min="${filterDetail.min}" max="${filterDetail.max}" step="${filterDetail.step}"
                       value="${filterDetail.value}"
                       data-filter="${filterDetail.name}">
                <span class="FilterValue">${filterDetail.value}</span>
            </div>
        </div>
    </g:each>

    <div class="Clear"></div>
</div>

<div id="original-size" class=""><canvas id="editOriginalImage" class="editorCanvas"></canvas></div>

<div id="editor-window"><canvas id="editImage" class="editorCanvas"></canvas></div>

<div class="Clear"></div>

<div id="buttons">
    <a id="resetBtn" href="javascript:void(0)" class="btn btn-primary disabled">RESET</a>
    <a id="saveBtn" href="javascript:void(0)" class="btn btn-primary disabled right"
    data-ajaxurl="${createLink(controller: 'image', action: 'saveEditedImage')}">SAVE</a>
</div>

<script type="text/javascript">
    (function ($) {
        $(function () { //on DOM ready
            galleryFunctionality.applySimplyScroll();
        });
    })(jQuery);
</script>