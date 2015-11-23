Given(/^A traveller chooses to add a ToDo$/) do
  visit root_path
  click 'Add Pebble'
end

Given(/^A traveller selects a destination$/) do
  select "Australia", from "Destinations"

When(/^Enters valid ToDo details$/) do
  fill_in "One liner", with: "Eat dirt"
  fill_in "Where", with: "Outback Go-Karts"

end

When(/^Submits the ToDo$/) do
  click "Bucket it"
end

Then(/^The ToDo is added to the list$/) do
  expect(page).to have_content "Eat dirt"
  expect(page).to have_content "Outback Go-Karts"
end