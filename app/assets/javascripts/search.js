$(document).ready( function() {

  var searchResultListTempl = _.template("<h3><%= resultsNum %> Results</h3> <ul class='results'></ul>")
  var searchResultTempl = _.template("<li> <%= description %> </li>")
  
  $('#search').keyup(function(e)
    {
      var searchTerm =  $(e.currentTarget).val();
      console.log(searchTerm)

      $.ajax({
        url: "/to_dos/search",
        data: {
          search: searchTerm
        },

        success: function(results) {
          var $resultList = $('#search-results');
          $resultList.html(searchResultListTempl({resultsNum: results.length}));
          var $ulResults = $resultList.find('.results')
          _(results).each(function(result){
            var liResult = searchResultTempl({description: result.description})
            $ulResults.append(liResult)
          });

        }
      })
    }
    )
})