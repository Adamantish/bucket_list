require 'rails_helper'

RSpec.describe ToDo, type: :model do
  before do 
    @destination = Destination.new(name: "India")
    @to_do = @destination.to_dos.build(:description => "Ride an Elephant", :address => "Delhi")
  end

  it "should build a string suitable for geocoding" do 
    expect(@to_do.geocode_string).to eq('Delhi, India')
  end
end
