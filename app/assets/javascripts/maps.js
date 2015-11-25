


function initMap() {
  window.markers = []
  window.map = new google.maps.Map($('#map-canvas')[0], {

    center: {lat: 11.689248, lng: 21.518491},
    zoom: 3
   });

  window.toDos = $('#map-canvas').data('toDos');
  map.latlngbounds = new google.maps.LatLngBounds()

  if(toDos.length > 0) {
    addMarkers(toDos)
  };

  $('#to_do_destination_id').on("change", function(event) {
    // debugger;
    var dest_id = $("#to_do_destination_id").val()
    showOnlyMarkersFor(dest_id) 
  });
 }

function addMarker(lat, lng, title) {

  var myLatLng = new google.maps.LatLng(lat, lng);
  var marker = new google.maps.Marker({

    position: myLatLng,
    title: title,
    map: map
  });
  
  markers.push(marker);
  map.latlngbounds.extend(myLatLng)
  marker.addListener("click", function() { showModal(toDo)})

};

function addMarkers(newToDos) {
    
    _(newToDos).each(function(toDo) {
      addMarker(toDo.lat, toDo.lng, toDo.description)
    })  

    map.fitBounds(map.latlngbounds)
    if(map.zoom > 12){
      map.setZoom(12)
    };
    map.setCenter(map.latlngbounds.getCenter())   
}

function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  map.latlngbounds = new google.maps.LatLngBounds()
}

function showOnlyMarkersFor(destination_id) {
  clearMarkers()
  filteredToDos = toDos.filter(function(obj) { 
    return obj.destination_id == destination_id
  });
  addMarkers(filteredToDos)
};

function showModal(toDo) {

  var $modalbk = $('<div></div>').attr("id", "modal-background")
  var $modal = $('<div></div>').attr("id", "modal")

  $modal.html(renderModal(toDo))

  $modal.css("left" , event.pageX + 10)
  $modal.css("top" , event.pageY + 10)
  $modalbk.click(function(){
    this.remove()
  })

  $modalbk.append($modal)
  // $('body').append($modalbk.append($modal))

$('body').append($modalbk)}


function renderModal(data) {

var template = _.template("<h1><%= description %></h1><p>Location: <%= address %></p>")

 return template(data)

};