
Feature: Likings
  
  Background:
    Given Kurt and Previn sadly exist

  Scenario: A visitor cannot click like button
    

  @wip @javascript
  Scenario: A traveller likes a ToDo which isn't already liked
    Given Previn has logged in
      And a traveller has some to dos in their bucket list
      And A traveller is on the homepage
      And The ToDo has no likes
    Then There is "" likes
    
    When The ToDo is liked by current traveller
    Then There is "1" likes
      And the like option is replaced with an unlike option
    When the page is reloaded
    Then There is "1" likes

  Scenario: A traveller likes a ToDo which already has been liked
    Given Previn has logged in
      And A traveller is on the homepage
      And a traveller has some to dos in their bucket list
    Given The ToDo is already liked by "kurt"
     When The ToDo is liked by current traveller
    Then There is "2" likes
      And the like option is replaced with an unlike option
    When the page is reloaded
    Then There is "2" likes
