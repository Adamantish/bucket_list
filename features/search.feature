Feature: Search Bucketlist

  Background:
    Given a traveller has some to dos in their bucket list

  @javascript
  @wip 
  Scenario: A traveller searches for an existing ToDo item
    Given a traveller is on the homepage
      And they start searching for a todo item
    Then I should see all partially matching searches
    When I finish typing out my search
    Then I should see all matching searches

  Scenario: A traveller searches for an existing ToDo Item via HTML
    Given a traveller is on the homepage
      And they start searching for a todo item
    When  I submit the search
    Then I should see all matching searches

  Scenario: A traveller searches for something that doesn't exist
    Given a traveller is on the homepage
      And they search for something ridiculous
    Then I should see a caveat saying "No results"