if ($("#charts").length > 0){
  google.load('visualization', '1', {packages: ['corechart', 'bar']});
  google.setOnLoadCallback(drawMultSeries);

  function drawMultSeries() {
    var data = google.visualization.arrayToDataTable([
      ['Testrun', 'Passed', 'Failed', 'Not executed', { role: 'annotation' } ],
      ['10-05-15', 35, 8, 1, ''],
      ['11-05-15', 34, 8, 2, ''],
      ['12-05-15', 32, 10, 2, ''],
      ['13-05-15', 35, 7, 2, ''],
      ['14-05-15', 37, 6, 1, ''],
      ['15-05-15', 36, 6, 2, ''],
      ['16-05-15', 36, 6, 2, ''],
      ['17-05-15', 38, 5, 1, ''],
      ['18-05-15', 23, 16, 5, ''],
      ['19-05-15', 33, 10, 1, ''],
      ['20-05-15', 38, 5, 1, ''],
      ['21-05-15', 40, 3, 1, '']
    ]);

    /*
    var jsonData = $.ajax({
      url: "testruns.json",
      dataType:"json",
      async: false
      }).responseText;
    var data = new google.visualization.DataTable(jsonData);
    */
    var options = {
      height: 400,
      legend: 'none',
      bar: { groupWidth: '50%' },
      isStacked: true,
        colors: ['#49bf67','#f34541', '#00acec']
    };

    var chart = new google.visualization.ColumnChart(
      document.getElementById('testruns_chart'));

    chart.draw(data, options);
  }
}
