<%@ page import="image.sharedit.Utils" %>
<div id="Filters">

    <g:each in="${Utils.imageEffects()}" var="effectDetail">
        <div class="Filter">
            <div class="FilterName">
                <p>${effectDetail.name}</p>
            </div>

            <div class="FilterSetting">
                <input type="range" min="${effectDetail.min}" max="${effectDetail.max}" step="${effectDetail.step}"
                       value="${effectDetail.value}"
                       data-filter="${effectDetail.name}">
                <span class="FilterValue">${effectDetail.value}</span>
            </div>
        </div>
    </g:each>

    <div class="Clear"></div>

</div>

<div id="editor-window"><canvas id="example"></canvas></div>

<div id="PresetFilters">
    <g:each in="${Utils.imageFilters()}">
        <a data-preset="${it.key}">${it.value}</a>
    </g:each>
</div>