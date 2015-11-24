
Given(/^There are at least (\d+) destinations$/) do |arg1|
  Destination.create!(name: "Australia")
  Destination.create!(name: "Finland")

end

Given(/^A traveller is on the homepage$/) do
  visit root_path
end

Given(/^A traveller chooses to add a ToDo$/) do
  click 'Add Pebble'
end

When(/^A traveller selects a destination$/) do
  save_and_open_page
  select "Australia", from: "to_do[destination_id]"
end

When(/^Enters valid ToDo details$/) do
  fill_in "to_do[description]", with: "Eat dirt"
  fill_in "to_do[address]", with: "Outback Go-Karts"

end

When(/^Submits the ToDo$/) do
  save_and_open_page
  click_button "btn__add-to_do"
end

Then(/^The ToDo is added to the list$/) do
  expect(page).to have_content "Eat dirt"
  expect(page).to have_content "Outback Go-Karts"
end