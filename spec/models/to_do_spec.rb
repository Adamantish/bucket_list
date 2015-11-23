require 'rails_helper'

RSpec.describe ToDo, type: :model do
  before do 
    @to_do = ToDo.new(:description => "Ride an Elephant", :address => "Delhi")
  end

  it "should build a string suitable for geocoding" do 
    expect(@to_do.geocode_string).to eq('Delhi')
  end
end
