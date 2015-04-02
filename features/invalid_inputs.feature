Feature: Invalid inputs
  As a NASA mission controller
  I want to ensure that any inputs are valid
  So the computer does not produce any errors

Scenario: Invalid grid dimensions
  Given I am on the start page
  When I enter invalid upper-right coordinates
  Then I should see "Invalid coordinates"

Scenario: Invalid rover position
  Given I input the plateau dimensions
  When I input an invalid position
  Then I should see "Invalid position"

Scenario: Invalid rover coordinates
  Given I input the plateau dimensions
  When I input invalid coordinates
  Then I should see "Invalid coordinates"

Scenario: Invalid move command
  Given I input the plateau dimensions
  When I input the position of a rover
  And I input an invalid command
  Then I should see "Invalid command"

Scenario: Cannot move rover outside grid
  Given I input the plateau dimensions
  When I input the position of a rover
  And I try to move the rover outside the grid
  Then I should see "Cannot move rover outside plateau. Rover stopped at coordinates 1 5"

Scenario: Cannot move rover onto a cell occupied by another rover
  Given I input the plateau dimensions
  And I input the position of a rover
  And I input a command for that rover
  When I input the position of another rover
  And I try to move that rover onto the same cell as the first rover
  Then I should see "Cannot move rover onto cell occupied by another rover. Rover stopped at coordinates 1 2"
