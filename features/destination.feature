Feature: Destinations

Scenario: A traveller chooses a destination
  Given A traveller has already set some ToDos
  # Given A traveller is using Bucket List for the first time
  When A traveller selects a destination
  Then Only markers for selected destination are shown

