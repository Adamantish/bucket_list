
function initMap() {
  window.markers = []
  window.map = new google.maps.Map($('#map-canvas')[0], {

    // center: {lat: 11.689248, lng: 21.518491},
    // zoom: 3
   });

  map.addListener("idle", showToDosInBounds)

  window.map.toDos = $('#map-canvas').data('toDos');
  map.latlngbounds = new google.maps.LatLngBounds()

  if(map.toDos.length > 0) {
    resetMarkers();
  };

  $('#destination__search-opts').on("change", function(event) {
    // debugger;
    var dest_id = $("#destination__search-opts").val()
    showOnlyMarkersFor(dest_id) 
  });

  $('#btn--search').on("keyDown", function(e){ console.log( e)})
 };

function resetMarkers(){
    clearMarkers();
    addMarkers(map.toDos)
};

function addMarker(lat, lng, title, id) {

  var myLatLng = new google.maps.LatLng(lat, lng);
  var marker = new google.maps.Marker({

    position: myLatLng,
    title: title,
    id: id,
    map: map
  });

  markers.push(marker);
  map.latlngbounds.extend(myLatLng);
  marker.addListener("click", function() { showModal(toDo)});
  fitMapToMarkers();
};

function addMarkers(newToDos) {
    _(newToDos).each(function(toDo) {
      addMarker(toDo.lat, toDo.lng, toDo.description, toDo.id)
    })  
}

function fitMapToMarkers() {
  map.fitBounds(map.latlngbounds)
  if(map.zoom > 12){
    map.setZoom(12)
  };
  map.setCenter(map.latlngbounds.getCenter())   
};

function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  map.latlngbounds = new google.maps.LatLngBounds()
  markers = [];
};

function showOnlyMarkers(ids){
  clearMarkers();
  var filteredToDos = map.toDos.filter(function(toDo) {
    return ids[toDo.id]
  });
  addMarkers(filteredToDos);
  showToDosInBounds();
};

function showOnlyMarkersFor(destination_id) {
  clearMarkers();
  var filteredToDos = map.toDos.filter(function(toDo) { 
    return toDo.destination_id == destination_id;
  });
  addMarkers(filteredToDos);
  showToDosInBounds();
};

function showToDosInBounds() {
  map.toDos.forEach(function(toDo) {
    var $foundItem = $("div[data_id=" + toDo.id + "]")
    var marker = markers.filter( function (marker) {
      return marker.id == toDo.id;
    })[0];

    $foundItem.addClass("undisplayed");
    if( !marker ) { return };

    var inBounds = map.getBounds().contains(marker.getPosition())
    
    if(inBounds){
      $foundItem.removeClass("undisplayed");
    };
  });
};

// function showModal(toDo) {

//   var $modalbk = $('<div></div>').attr("id", "modal-background")
//   var $modal = $('<div></div>').attr("id", "modal")

//   $modal.html(renderModal(toDo))

//   $modal.css("left" , event.pageX + 10)
//   $modal.css("top" , event.pageY + 10)
//   $modalbk.click(function(){
//     this.remove()
//   })

//   $modalbk.append($modal)
//   // $('body').append($modalbk.append($modal))

//   $('body').append($modalbk)
// }


// function renderModal(data) {

// var template = _.template("<h1><%= description %></h1><p>Location: <%= address %></p>")

//  return template(data)

// };