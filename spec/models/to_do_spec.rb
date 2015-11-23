require 'rails_helper'

RSpec.describe ToDo, type: :model do
  before do 
    @destination = Destination.new(name: "India")
    @to_do = @destination.to_dos.build(:description => "Ride an Elephant", :address => "Delhi")
  end

  it "should build a string suitable for geocoding" do 
    expect(@to_do.geocode_string).to eq('Delhi, India')
  end

  it "should geocode the coordinates on save" do

    @to_do.geocode
    
    expect(@to_do.lat). to eq 28.6139391
    expect(@to_do.lng). to eq 77.2090212
  end
end
