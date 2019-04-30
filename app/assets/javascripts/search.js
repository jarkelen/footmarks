var ready;
ready = function() {
  $('#search').bind('keydown keypress keyup change', function() {
    var search = this.value;
    var $tr = $("#search_items tr.item").hide();
    $tr.filter(function() {
      return $(this).text().toLowerCase().indexOf(search.toLowerCase()) >= 0;
    }).show();

    var rows = $('#search_items tr:visible').length - 1;
    $('.search_count').text(rows + " visits");
  });
};
$(document).ready(ready);
$(document).on('page:load', ready);