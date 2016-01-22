$(document).ready( function() {

  $('#btn--search').addClass('undisplayed');
  $('#container--search-results').addClass('undisplayed');
  
  $('#search').keyup( function(e){  
    if ( e.keyCode != 13 ) {
      return makeSearch(e);
    }
  });
});

// TODO: Refactor to remove this and instead use the existing _search partial for dryness.
function makeSearch(e){

  var searchTerm =  $(e.currentTarget).val();

  if ( searchTerm.length < 1){
    $('#container--search-results').addClass('undisplayed')
    resetMarkers();
  } else {
    
    // Going to the server is really unnecessary seeing as we've already fetched the whole search set but let's pretend we paged it instead.

    $.ajax({
      url: "/to_dos/search",
      data: {
        search: searchTerm
      },
      // And when it the data comes back we'll take advantage of the fact that actually we have everything needed.
      // If I were to do an infinite scroll kind of partial load I'd have this identify any toDos not already in the DOM and append them
      success: function(results) { renderSearchResults( results ) }
    });
  };
};

renderSearchResults = function(results) {

  var searchResultListTempl = _.template("<h3><%= resultsNum == 0 ? 'No' : resultsNum %> Results</h3> <ul class='results'></ul>");
  var searchResultTempl = _.template("<li> <%= description %> in <%= destination %></li>");
  var $resultList = $('#search-results');

  $resultList.html(searchResultListTempl({ resultsNum: results.length }));
  var $ulResults = $resultList.find('.results');
  
  var ids = {};

  _(results).each(function(result){
    ids[result.id] = "Nowt"
    // var liResult = searchResultTempl({description: result.description, destination: result.destination_name})
    // $ulResults.append(liResult)
  });

  // Filter displayed map markers
  showOnlyMarkers(ids);

  $('#container--search-results').removeClass('undisplayed')

};

