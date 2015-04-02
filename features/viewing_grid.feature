Feature: Viewing grid
  As a NASA mission controller
  I want to see where the rovers are on the grid
  So I can move them effectively

  Scenario: Empty grid when plateau generated
    Given I input the plateau dimensions
    Then I should see the plateau grid

  Scenario: Rovers displayed on grid
    Given I input the plateau dimensions
    When I input the position of a rover
    Then I should see that rover on the grid
