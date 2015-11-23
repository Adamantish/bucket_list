Feature: ToDo Editing

Scenario: A traveller adds a ToDo item
  Given A traveller selects a destination
    And A traveller chooses to add a ToDo
  When Enters valid ToDo details
    And Submits the ToDo
  Then The ToDo is added to the list
