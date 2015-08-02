if ($("#charts").length > 0){
  google.load('visualization', '1', {'packages':['corechart','calendar']});

  google.setOnLoadCallback(drawChart);
  function drawChart() {
    // Create data for passed calendar
    var data_array1 = JSON.parse($("#calendar_data_passed").html());
    var data1 = new google.visualization.DataTable();
    data1.addColumn({ type: 'date', id: 'Date' });
    data1.addColumn({ type: 'number', id: 'Passed' });
    for (var i = 0; i < data_array1.length; i++) {
      data1.addRow([new Date(data_array1[i][0]), data_array1[i][1]]);
    }

    // Set data area chart
    var data_array2 = JSON.parse($("#chart_data").html());
    var data2 = google.visualization.arrayToDataTable(data_array2);

    // Create data for failed calendar
    var data_array3 = JSON.parse($("#calendar_data_failed").html());
    var data3 = new google.visualization.DataTable();
    data3.addColumn({ type: 'date', id: 'Date' });
    data3.addColumn({ type: 'number', id: 'Failed' });
    for (var i = 0; i < data_array3.length; i++) {
      data3.addRow([new Date(data_array3[i][0]), data_array3[i][1]]);
    }

    // Set options for passed calendar
    var options1 = {
      title: "Passed test cases",
      colorAxis: {colors: ['#E5FFE5', '#006600']}
    };

    // Set options for area chart
    var options2 = {
      height: 300,
      pointSize: 5,
      chartArea:{left:50,top:30,width:'93%',height:'80%'},
      isStacked: false,
      colors: ['#49bf67','#f34541', '#00acec'],
      hAxis: { textPosition: 'none' },
      vAxis: { minValue: 0 },
      legend: { position: 'bottom' }
    };

    // Set options for failed calendar
    var options3 = {
      title: "Failed test cases",
      colorAxis: {colors: ['#fcebe6', '#8a2208']}
    };

    // Draw area chart
    var area_chart = new google.visualization.AreaChart(document.getElementById('testruns_chart'));
    area_chart.draw(data2, options2);

    // Draw calendar passed
    var calendar_passed = new google.visualization.Calendar(document.getElementById('calendar_chart_passed'));
    calendar_passed.draw(data1, options1);

    // Draw calendar failed
    var calendar_failed = new google.visualization.Calendar(document.getElementById('calendar_chart_failed'));
    calendar_failed.draw(data3, options3);
  }

}
