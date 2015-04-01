Feature: Moving a rover
  As a NASA mission controller
  I want to input text commands
  So I can move a rover within the plateau

  Scenario: Selecting a rover
    Given I have inputted the plateau dimensions
    When I input x and y coordinates and an orientation
    Then I should see "Rover in position 1 2 N successfully selected"
