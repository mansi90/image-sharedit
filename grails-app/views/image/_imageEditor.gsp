<%@ page import="image.sharedit.Utils" %>
<div id="PresetFilters">
    <ul id="scroller">
        <g:each in="${Utils.imageEffects()}">
            <li>
                <a data-preset="${it.key}">
                    <asset:image src="scenery.jpg" width="150" height="94"/>
                    <p style="text-align: center">${it.value}</p>
                </a>
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

<div id="editor-window"><canvas id="example"></canvas></div>
<script type="text/javascript">
    (function ($) {
        $(function () { //on DOM ready
            galleryFunctionality.applySimplyScroll();
        });
    })(jQuery);
</script>