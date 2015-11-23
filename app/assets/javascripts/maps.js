
function initMap() {
  map = new google.maps.Map($('#map-canvas')[0], {

    center: {lat: -34.397, lng: 150.644},
    zoom: 8

  });

var toDos = $('#map-canvas').data('toDos');
  _(toDos).each(function(toDo) {
    var myLatLng = new google.maps.LatLng(toDo.lat, toDo.lng);
    var marker = new google.maps.Marker({

      position: myLatLng,
      title: toDo.description,
      map: map
    });
  })
}

