<%@ page import="image.sharedit.User; image.sharedit.ClubMember;" %>
<fieldset class="form">
    <div class="fieldcontain required">
        <label for="name">Name
            <span class="required-indicator">*</span>
        </label>
        <g:field type="text" name="name" value="${club?.name}" required="" style="height: 30px !important;"/>
    </div>
</fieldset>

<div class="fieldcontain">
    <label for="clubMembers">Add Members</label>

    <g:select name="clubMembers" from="${User.list()}"
              style=" width: 450px !important;" optionValue="username"
              optionKey="id" value="${club?.id ? ClubMember.findAllByClub(club)*.user : ''}" multiple="true"
              class="select-box chosen-select"/>
</div>
<asset:javascript src="chosen/chosen.jquery.js"/>
<asset:javascript src="chosen/prism.js" charset="utf-8"/>
<script type="text/javascript">
    var config = {
        '.chosen-select': {},
        '.chosen-select-deselect': {allow_single_deselect: true},
        '.chosen-select-no-single': {disable_search_threshold: 10},
        '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
        '.chosen-select-width': {width: "95%"}
    };
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }
</script>
<asset:stylesheet src="chosen/prism.css"/>
<asset:stylesheet src="chosen/chosen.css"/>
<style type="text/css" media="all">
/* fix rtl for demo */
.chosen-rtl .chosen-drop {
    left: -9000px;
}

.chosen-container-multi .chosen-choices {
    padding: 7px 5px !important;
    min-height: 35px !important;
}

.chosen-container-multi .chosen-choices li.search-choice {
    margin: 0 2px !important;
    padding: 2px 20px 3px 5px !important;
}
</style>