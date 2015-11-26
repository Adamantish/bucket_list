
Given(/^There are at least (\d+) destinations$/) do |arg1|
  Destination.create!(name: "India")
  Destination.create!(name: "Finland")

end

# Given(/^We expect to go to Delhi, India$/) do
  
#   Geocoder.configure(:lookup => :test)

#   Geocoder::Lookup::Test.add_stub(
#     "Delhi, India", [
#       {
#         'latitude'     => 28.6139391,
#         'longitude'    => 77.2090212,
#         'address'      => 'Delhi, India',
#         'country'      => 'India'
#       }
#     ]
#   )

# end

Given(/^A traveller is on the homepage$/) do
  visit root_path
end

Given(/^A traveller chooses to add a ToDo$/) do
  click 'Add Pebble'
end

When(/^A traveller selects a destination$/) do
  # save_and_open_page
  select "India", from: "to_do[destination_id]"
end

When(/^Enters valid ToDo details$/) do
  fill_in "to_do[description]", with: "Get Spiritual"
  fill_in "to_do[address]", with: "Delhi"
end

When(/^Submits the ToDo$/) do
  click_on "btn__add-to_o"
end

Then(/^The ToDo is added to the list$/) do
  sleep 1
  expect(page).to have_content "Get Spiritual"
  expect(page).to have_content "Delhi"
end