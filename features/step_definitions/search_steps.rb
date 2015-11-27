Given(/^they start searching for a todo item$/) do
  fill_in "Search", :with => "Ride"
end

Then(/^I should see all partially matching searches$/) do
  within('#search-results') do
    expect(page).to have_content('Ride Elephant')
    expect(page).to have_content('Ride in an aircraft')
  end
end

Then(/^I should see all matching searches$/) do
  save_and_open_page
  within('#search-results') do
    expect(page).to have_content('Ride Elephant')
  end  
end

When(/^I finish typing out my search$/) do
  fill_in "Search", :with => "Ride Elephant"
end

Given(/^they search for something ridiculous$/) do
  fill_in "Search", :with => "Ooobly blah blah"
end

Then(/^I should see a caveat saying "(.*?)"$/) do |message|
  within('#search-results') do
    expect(page).to have_content(message)
  end
end

When(/^I submit the search$/) do
  find('#btn--search').click
end

