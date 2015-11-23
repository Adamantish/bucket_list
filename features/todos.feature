Feature: ToDo Editing

Scenario: A traveller adds a ToDo item
  Given A traveller chooses to add a ToDo
  When A traveller selects a destination
    And Enters valid details
    And Submits the ToDo
  Then A ToDo is added to the list
