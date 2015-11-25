Feature: ToDo Editing

Background:
  Given We expect to go to Delhi, India
  
Scenario: A traveller opens Bucket List for the first time
  Given Nothing

Scenario: A traveller adds a ToDo item
  Given There are at least 2 destinations
    And A traveller is on the homepage
  When A traveller selects a destination 
  # When A traveller chooses to add a ToDo
    And Enters valid ToDo details
    And Submits the ToDo
  Then The ToDo is added to the list

@javascript
Scenario: A traveller adds a ToDo item
  Given There are at least 2 destinations
    And A traveller is on the homepage
  When A traveller selects a destination 
  # When A traveller chooses to add a ToDo
    And Enters valid ToDo details
    And Submits the ToDo
  Then The ToDo is added to the list