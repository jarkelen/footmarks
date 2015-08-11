var ready;
ready = function() {
  if ($("#company_id_eq").length > 0){
    $.conditionalize($("#league_country_eq"), $("#league_id_eq"), "data-country");
  }
};
$(document).ready(ready);
$(document).on('page:load', ready);

$.conditionalize = function(sourceSelect, targetSelect, dataSelector){
  options = $(targetSelect).children().clone();
  $(sourceSelect).on('change', function() {
    selected_id = $(this).val();
    $(targetSelect).children().slice(1).remove();

    if (selected_id == ""){
      options.appendTo(targetSelect);
    }
    else{
      options.filter('[' + dataSelector + '="' + selected_id + '"]').appendTo(targetSelect);
    }
  });
}