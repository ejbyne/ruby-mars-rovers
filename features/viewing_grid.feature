Feature: Viewing grid
  As a NASA mission controller
  I want to see where the rovers are on the grid
  So I can move them effectively

  Scenario: Empty grid when plateau generated
    Given I input the plateau dimensions
    Then I should see the plateau grid
