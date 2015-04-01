Feature: Moving a rover
  As a NASA mission controller
  I want to input text commands
  So I can move a rover within the plateau

  Scenario: Selecting a rover
    Given I have inputted the plateau dimensions
    When I input x and y coordinates and an orientation
    Then I should see "Rover in position 1 2 N successfully selected"

  Scenario: Moving a rover
    Given I have inputted the plateau dimensions
    And I have inputted the position of a rover
    When I input a move command for that rover
    Then I should see "Rover successfully moved from position 1 2 N to position 1 3 N"
