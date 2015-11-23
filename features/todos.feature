Feature: ToDo Editing

Background: 
  Given There are at least 2 destinations
    And A traveller is on the homepage

Scenario: A traveller adds a ToDo item
  # Given A traveller chooses to add a ToDo
    Given A traveller selects a destination 
  When Enters valid ToDo details
    And Submits the ToDo
  Then The ToDo is added to the list
