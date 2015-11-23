class ToDo < ActiveRecord::Base

    def geocode_string
      address
    end
end
