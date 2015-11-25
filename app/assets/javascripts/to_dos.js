// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
  // var $butt = $('#btn__add-to_do')
  // $butt.click(function(e) {
  //   $('#new_to_do').css("opacity", "0")

  // });

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