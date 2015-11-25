module FlickrService
  include HTTParty
  base_uri 'api.flickr.com:443'
  
  PHOTO_SIZES =  {
    
    "Square" => "_s" ,
    "Large Square" => "_q" ,
    "Thumbnail" => "_t" ,
    "Small" => "_m" ,
    "Small 320" => "_n" ,
    "Medium" =>  "" ,
    "Medium 640" => "_z" ,
    "Medium 800" => "_c" ,
    "Large" => "_b" ,
    "Original" => "_o" 
  }

  def self.photos_of(search: , lat: ,lng:, size: "Medium")
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

  Photo = Struct.new(:id, :title, :size, :secret, :farm, :server) do 
    def image_url
      "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}#{PHOTO_SIZES[size]}.jpg"
    end
  end


end