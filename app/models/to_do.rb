class ToDo < ActiveRecord::Base

  belongs_to :destination

    def geocode_string
      "#{address}, #{destination.name}"
    end
end
