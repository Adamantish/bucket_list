class ToDo < ActiveRecord::Base

  belongs_to :destination

  geocoded_by :geocode_string, latitude: :lat, longitude: :lng
  before_save :geocode

  validates :destination_id , numericality: {greater_than: 0}

    def geocode_string
      "#{address}, #{destination.name}"
    end

end
