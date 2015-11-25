Given(/^a traveller has some to dos in their bucket list$/) do

  @destination = Destination.create!(name: "India")
  ToDo.create!(description: "Ride Elephant", address: "Delhi", destination: @destination)

end

Given(/^a traveller is on the homepage$/) do
  click_link "Show photos"
end

When(/^they select the photos tab$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^they should see photos of their to do item$/) do
  pending # express the regexp above with the code you wish you had
end