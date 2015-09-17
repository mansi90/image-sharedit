<%@ page import="image.sharedit.Utils" %>
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

<div id="PresetFilters">
    <g:each in="${Utils.imageEffects()}">
        <a data-preset="${it.key}">${it.value}</a>
    </g:each>
</div>