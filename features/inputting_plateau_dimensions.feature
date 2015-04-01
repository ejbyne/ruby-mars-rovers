Feature: Inputting plateau dimensions
  As a NASA mission controller
  I want to specify the dimensions of the plateau
  So the computer can create a grid of possible coordinates

  Scenario: Inputting dimensions
    Given I am on the start page
    When I enter the relevant upper-right coordinates
    Then I should see "Coordinates generated"
