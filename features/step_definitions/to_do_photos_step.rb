Given(/^a traveller has some to dos in their bucket list$/) do

  @destination = Destination.create!(name: "India")
  ToDo.create!(description: "Ride Elephant", address: "Delhi", destination: @destination)

end


When(/^they select the photos link$/) do
  click_link "Show snaps"
end

Then(/^they should see photos of their to do item$/) do
  pending # express the regexp above with the code you wish you had
end