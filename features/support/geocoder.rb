Geocoder.configure( lookup: :test)

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
