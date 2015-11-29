

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

ToDo.prototype.insertUpdatedToDo = function(newHTML) {
  this.$el.html(newHTML)
};

$(document).ready(function() {

  // var $butt = $('#btn__add-to_do')
  // $butt.click(function(e) {
  //   $('#new_to_do').css("opacity", "0")

  // });
   $('#select--sort-to_dos').on("change", function(e){
    sortElements("#to_dos", $(e.target).val())
  });

   toggleNewToDo();

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
   toggleNewToDo()
  };
};


function toggleNewToDo() {
  $('#add__to_do').children().toggleClass("undisplayed")
};