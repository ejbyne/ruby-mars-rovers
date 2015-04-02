Feature: Invalid inputs
  As a NASA mission controller
  I want to ensure that any inputs are valid
  So the computer does not produce any errors

Scenario: Invalid grid dimensions
  Given I am on the start page
  When I enter invalid upper-right coordinates
  Then I should see "Invalid coordinates"
