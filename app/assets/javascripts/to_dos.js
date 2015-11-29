

window.toDos = {}

var ToDo = function(id, selector){
  this.id = id
  this.$el = $(selector)
  this.html = $(selector).html()
  window.toDos[id] = this
}

ToDo.prototype.cancelEdit = function() {
  this.$el.html(this.html)
};

$(document).ready(function() {

  // var $butt = $('#btn__add-to_do')
  // $butt.click(function(e) {
  //   $('#new_to_do').css("opacity", "0")

  // });
  $('#map-canvas').attr("style", "position: fixed; overflow: hidden; transform: translateZ(0px); background-color: rgb(229, 227, 223);")
  $('#select--sort-to_dos').on("change", function(e){
    sortElements("#to_dos", $(e.target).val())
  });

});

function sortElements(selector, sort_by) {
  var el = $(selector)
  var $kids = $(selector).children()

  $kids.sort( function(a,b) {
    var aComparator = a.getAttribute(sort_by)
    var bComparator = b.getAttribute(sort_by)

    if(aComparator < bComparator) { return -1
    } else { 
      return 1
    };
  });

  $kids.detach().appendTo(el)

};

function cancelToDoEdit(toDoID) {
  if(toDoID){
    return toDos[toDoID].cancelEdit()
  } else {
    $('#new_to_do').html("<button id='btn__new_to_do'>+</button>")
  };
};