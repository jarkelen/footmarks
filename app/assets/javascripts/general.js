var ready;
ready = function() {
  if ($("#q_league_country_eq").length > 0){
    $.conditionalize($("#q_league_country_eq"), $("#q_league_id_eq"), "data-country");
  }

  if ($("#q_home_club_league_country_eq").length > 0){
    $.conditionalize($("#q_home_club_league_country_eq"), $("#q_league_id_eq"), "data-country");

    if ($("#q_home_club_id_eq").length > 0){
      //$.conditionalize($("#q_league_id_eq"), $("#q_home_club_id_eq"), "data-league");
    }
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
