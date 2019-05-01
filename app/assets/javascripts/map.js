$(document).ready(function() {
  if ($("#mapid").length > 0){
    var mymap = L.map('mapid').setView([54.666710, -2.754990], 6);

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiamFya2VsZW4iLCJhIjoiY2p2NHZoY3d4MWcwbDRlcDlxODFsNzYwNSJ9.FSMxUuQ5EvR_e0c7vnrvoQ', {
      maxZoom: 18,
      id: 'mapbox.streets',
      zoomControl: true,
      attributionControl: true
    }).addTo(mymap);

    var marker = L.marker([51.5, -0.09]).addTo(mymap);
    marker.bindPopup("<b>Hello world!</b><br>I am a popup.");

    /*


    // initializing map

    $.getJSON( 'map.json', function(data) {
      $.each(data, function(index) {
        if (data[index].longitude != ""){
          var contentString = '<div class="marker_content">'+
            '<p>'+data[index].visit_date+'</p>'+
            '<h5 class="header">'+data[index].home_club.name+' v '+data[index].away_club.name+'</h5>'+
            '<div class="link"><a href="/footmarks/'+data[index].id+'">details</a></div>'
            '</div>';

          var infowindow = new google.maps.InfoWindow({
            content: contentString
          });

          var marker = new google.maps.Marker({
            position: new google.maps.LatLng(data[index].latitude,data[index].longitude),
            map: map,
            animation: google.maps.Animation.DROP,
            icon: image
          });
          google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map,marker);
          });
        }
      });
    });
    */

  }
});
