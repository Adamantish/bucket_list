Given(/^a traveller has some to dos in their bucket list$/) do

  @destination = Destination.create!(name: "India")
  @to_do = ToDo.create!(description: "Ride Elephant", address: "Delhi", destination: @destination)

  @uk = Destination.create!(name: "UK")
  @aircraft = ToDo.create!(description: "Ride in an aircraft", address: "Torquay", destination: @uk)

end

When(/^they select the photos tab$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^they should see photos of their to do item$/) do
  pending # express the regexp above with the code you wish you had
end