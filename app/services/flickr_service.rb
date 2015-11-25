module FlickrService
  include HTTParty
  base_uri 'api.flickr.com:443'
  
  def self.photos_of(search: , lat: ,lng:)
    response = self.get("/services/rest", {query: 
        {method:'flickr.photos.search',
          tags: tag_list(search),
          api_key: Rails.application.secrets[:flickr_api_key],
          format:'json',
          lat: lat,
          lon: lng,
          nojsoncallback: 1
        }
      }
    )
    
    response["photos"]["photo"].map do |photo|
      Photo.new(photo["id"], photo["title"], photo["secret"], photo["farm"], photo["server"])
    end
  end

  def self.tag_list(search)
    search.split(" ").join(",")
  end

  Photo = Struct.new(:id, :title, :secret, :farm, :server) do 
    def image_url
      "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg"
    end
  end


end