$(document).ready(function() {
  if ($("#mapid").length > 0){
    var mymap = L.map('mapid').setView([54.666710, -2.754990], 6);

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiamFya2VsZW4iLCJhIjoiY2p2NHZoY3d4MWcwbDRlcDlxODFsNzYwNSJ9.FSMxUuQ5EvR_e0c7vnrvoQ', {
      maxZoom: 18,
      id: 'mapbox.streets',
      zoomControl: true,
      attributionControl: true
    }).addTo(mymap);

    $.getJSON( 'map.json', function(data) {
      $.each(data, function(index) {
        if (data[index].longitude != null && data[index].latitude != null){
          var contentString = '<div class="marker_content">'+
            '<div class="visit_date">'+data[index].visit_date+'</div>'+
            '<div class="match">' + data[index].home + ' v ' + data[index].away + '</div>'+
            '<div class="ground">'+data[index].ground+'</div>'+
            '<div class="link"><a href="/footmarks/'+data[index].id+'">details</a></div>'
            '</div>';

          var marker = L.marker(L.latLng(parseFloat(data[index].latitude), parseFloat(data[index].longitude))).addTo(mymap);
          marker.bindPopup(contentString);
        }
      });
    });

  }
});
