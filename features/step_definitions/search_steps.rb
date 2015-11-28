Given(/^they start searching for a todo item$/) do
  fill_in "search", :with => "Ride"
end

Then(/^I should see all partially matching searches$/) do
  within('#search-results') do
    expect(page).to have_content('Ride Elephant')
    expect(page).to have_content('Ride in an aircraft')
  end
end

Then(/^I should see all matching searches$/) do
  within('#search-results') do
    expect(page).to have_content('Ride Elephant')
  end  
end

When(/^I finish typing out my search$/) do
  fill_in "search", :with => "Ride Elephant"
end

Given(/^they search for something ridiculous$/) do
  fill_in "search", :with => "Ooobly blah blah"
end

Then(/^I should see a caveat saying "(.*?)"$/) do |message|
  within('#search-results') do
    expect(page).to have_content(message)
  end
end

When(/^I submit the search$/) do
  find('#btn--search').click
end

Then(/^there are no search results$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^they delete the search$/) do
    fill_in "search", :with => ""
end

Then(/^The search results container should not be displayed$/) do
  expect(page).to have_css("#container--search-results.undisplayed")
end
