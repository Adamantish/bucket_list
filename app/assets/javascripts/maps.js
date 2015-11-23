


function initMap() {
  var map = new google.maps.Map($('#map-canvas')[0], {

    center: {lat: -34.397, lng: 150.644},
    zoom: 8
   });

  window.toDos = $('#map-canvas').data('toDos');
  map.latlngbounds = new google.maps.LatLngBounds()

  addMarkers(map, toDos)

 }

function addMarkers(map, newToDos) {
    
    _(toDos).each(function(toDo) {
      var myLatLng = new google.maps.LatLng(toDo.lat, toDo.lng);
      var marker = new google.maps.Marker({

        position: myLatLng,
        title: toDo.description,
        map: map
      });

      map.latlngbounds.extend(myLatLng)
      marker.addListener("click", function() { showModal(toDo)})

    })  
    map.setCenter(map.latlngbounds.getCenter())
    map.fitBounds(map.latlngbounds)
}


function showModal(toDo) {

  var $modalbk = $('<div></div>').attr("id", "modal-background")
  var $modal = $('<div></div>').attr("id", "modal")
  
  var modalHTML =  "<h1>A Title</h1>"
  modalHTML += "<p>A longish description</p>"

  $modal.html(renderModal(toDo))

  $modal.css("left" , event.pageX + 10)
  $modal.css("top" , event.pageY + 10)
  $modalbk.click(function(){
    this.remove()
  })

  $modalbk.append($modal)
  // $('body').append($modalbk.append($modal))

$('#map-canvas').append($modalbk)}


function renderModal(data) {

var template = _.template("<h1><%= description %></h1><p>Location: <%= address %></p>")

 return template(data)
}