$(document).ready(function() {
  if ($("#mapid").length > 0){
    var mymap = L.map('mapid').setView([51.505, -0.09], 13);

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
      maxZoom: 18,
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      id: 'mapbox.streets'
    }).addTo(mymap);

    /*
    var mapOptions = {
      center: new google.maps.LatLng(54.8949509,-2.9116577),
      zoom: 6,
      mapTypeId: google.maps.MapTypeId.NORMAL,
      panControl: true,
      scaleControl: false,
      streetViewControl: true,
      overviewMapControl: true
    };

    // initializing map
    var map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);
    var image = 'https://dl.dropboxusercontent.com/u/45762137/Football/football-icon.png'

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
