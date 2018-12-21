var ready;
ready = function() {
  $('#search').bind('keydown keypress keyup change', function() {
    var search = this.value;
    var $tr = $("#footmarks tr.footmark").hide();
    $tr.filter(function() {
      return $(this).text().toLowerCase().indexOf(search.toLowerCase()) >= 0;
    }).show();

    var rows = $('#footmarks tr:visible').length - 1;
    $('.footmarks_count').text(rows + " visits");
  });
};
$(document).ready(ready);
$(document).on('page:load', ready);