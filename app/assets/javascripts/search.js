$(document).ready( function() {

  $('#btn--search').addClass('undisplayed')
  $('#container--search-results').addClass('undisplayed')
  
  $('#search').keyup( function(e){  
    if( e.keyCode != 13 ) {
      return makeSearch(e);
    };
  })
});

// TODO: Refactor to remove this and instead use the existing _search partial for dryness.
function makeSearch(e){

  var searchTerm =  $(e.currentTarget).val();
  if(searchTerm.length < 1){
    $('#container--search-results').addClass('undisplayed')
  } else {
    
    $.ajax({
      url: "/to_dos/search",
      data: {
        search: searchTerm
      },

      success: function(results) {renderSearchResults(results)}
    })
  };
};

renderSearchResults = function(results) {

  var searchResultListTempl = _.template("<h3><%= resultsNum == 0 ? 'No' : resultsNum %> Results</h3> <ul class='results'></ul>")
  var searchResultTempl = _.template("<li> <%= description %> </li>")
  var $resultList = $('#search-results');

  $resultList.html(searchResultListTempl({resultsNum: results.length}));
  var $ulResults = $resultList.find('.results')
  
  _(results).each(function(result){
    var liResult = searchResultTempl({description: result.description})
    $ulResults.append(liResult)
  });

  debugger;
  // Filter displayed map markers
  
  // showOnlyMarkers

  $('#container--search-results').removeClass('undisplayed')

};

