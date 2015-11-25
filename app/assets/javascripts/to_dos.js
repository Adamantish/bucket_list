// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
  // var $butt = $('#btn__add-to_do')
  // $butt.click(function(e) {
  //   $('#new_to_do').css("opacity", "0")

  // });

  $('#select--sort-to_dos').on("change", function(e){
    debugger;

    sortElements("#to_dos", $(e.target).val())
  });



});

function sortElements(selector, sort_by) {
  var el = $(selector)
  var $kids = $(selector).children()

  debugger;
  $kids.sort( function(a,b) {
    var aTitle = a.getAttribute(sort_by)
    var bTitle = b.getAttribute(sort_by)

    if(aTitle < bTitle) { return -1
    } else { 
      return 1
    };
  });

  $kids.detach().appendTo(el)

};