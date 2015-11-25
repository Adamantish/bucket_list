require 'rails_helper'


RSpec.describe ToDo, type: :model do
  before do 
    Geocoder.configure(:lookup => :test)

    Geocoder::Lookup::Test.add_stub(
      "Delhi, India", [
        {
          'latitude'     => 28.6139391,
          'longitude'    => 77.2090212,
          'address'      => 'Delhi, India',
          'country'      => 'India'
        }
      ]
    )

    @destination = Destination.create(name: "India")
    @to_do = @destination.to_dos.build(:description => "Ride an Elephant", :address => "Delhi")

    flickr_elephant_data = JSON(File.read('spec/fixtures/Elephant_ride.json'))
    allow(FlickrService).to receive(:get).and_return(flickr_elephant_data)

  end


  it "should build a string suitable for geocoding" do 
    expect(@to_do.geocode_string).to eq('Delhi, India')
  end

  it "geocodes the coordinates" do

    @to_do.geocode

    expect(@to_do.lat). to eq 28.6139391
    expect(@to_do.lng). to eq 77.2090212
  end

  it "geocodes on save" do 
    @to_do.save!

    expect(@to_do.lat). to eq 28.6139391
    expect(@to_do.lng). to eq 77.2090212
  end

  it "can fetch array of flickr photo objects" do
    @to_do.save!
    expect(@to_do.photos[0].is_a? Struct)
  end
end
