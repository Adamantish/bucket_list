$(document).ready( function() {

  $('#btn--search').addClass('undisplayed')
  $('#container--search-results').addClass('undisplayed')
  
  $('#search').keyup( function(e){return makeSearch(e)} )
});

function makeSearch(e){

  var searchTerm =  $(e.currentTarget).val();
  if(searchTerm.length == 0){
    $('#container--search-results').addClass('undisplayed')
  } else {
    
    $.ajax({
      url: "/to_dos/search",
      data: {
        search: searchTerm
      },

      success: function(results){ 

        var searchResultListTempl = _.template("<h3><%= resultsNum %> Results</h3> <ul class='results'></ul>")
        var searchResultTempl = _.template("<li> <%= description %> </li>")

        var $resultList = $('#search-results');

        if(results.length == 0) {
          $resultList.html(searchResultListTempl({resultsNum: "No"}));
        } else {

            $resultList.html(searchResultListTempl({resultsNum: results.length}));
            var $ulResults = $resultList.find('.results')
            _(results).each(function(result){
              var liResult = searchResultTempl({description: result.description})
              $ulResults.append(liResult)
            });

          };

        $('#container--search-results').removeClass('undisplayed')


      }
    })
  };
};


function returnSearch(results){
   
};
