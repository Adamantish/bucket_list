
Given(/^a traveller has some to dos in their bucket list$/) do
  @destination = Destination.create!(name: "India")
  ToDo.create!(description: "Ride Elephant", address: "Delhi", destination: @destination)

  @uk = Destination.create!(name: "UK")
  ToDo.create!(description: "Ride in an aircraft", address: "Torquay", destination: @uk)
 
end

Given(/^There are at least (\d+) destinations$/) do |arg1|
  Destination.create!(name: "India")
  Destination.create!(name: "Finland")

end

Given(/^A traveller is on the homepage$/) do
  visit root_path
end

Given(/^A traveller chooses to add a ToDo$/) do
  click 'Add Pebble'
end

When(/^A traveller selects a destination$/) do
  select "India", from: "to_do[destination_id]"
  save_and_open_page
end

When(/^Enters valid ToDo details$/) do
  fill_in "to_do[description]", with: "Get Spiritual"
  fill_in "to_do[address]", with: "Delhi"
end

When(/^Submits the ToDo$/) do
  click_on "btn__add-to_do"
  save_and_open_page
end

Then(/^The ToDo is added to the list$/) do
  sleep 1
  expect(page).to have_content "Get Spiritual"
  expect(page).to have_content "Delhi"
end