class ToDo < ActiveRecord::Base

  belongs_to :destination

  geocoded_by :geocode_string, latitude: :lat, longitude: :lng

  before_save :geocode

    def geocode_string
      "#{address}, #{destination.name}"
    end

end
