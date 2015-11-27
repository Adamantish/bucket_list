Given(/^they start searching for a todo item$/) do
  fill_in "Search", :with => "Ride"
end

Then(/^I should see all partially matching searches$/) do
  within('#search-results') do
    expect(page.has_content?('Ride an elephant')).to be true
    expect(page.has_content?('Ride in an aircraft')).to be true
  end
end

Then(/^I should see all matching searches$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I finish typing out my search$/) do
  pending # express the regexp above with the code you wish you had
end
