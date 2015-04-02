Feature: Invalid inputs
  As a NASA mission controller
  I want to ensure that any inputs are valid
  So the computer does not produce any errors

Scenario: Invalid grid dimensions
  Given I am on the start page
  When I enter invalid upper-right coordinates
  Then I should see "Invalid coordinates"

Scenario: Invalid rover position
  Given I have inputted the plateau dimensions
  When I input an invalid position
  Then I should see "Invalid position"

Scenario: Invalid rover coordinates
  Given I have inputted the plateau dimensions
  When I input invalid coordinates
  Then I should see "Invalid coordinates"

Scenario: Invalid move command
  Given I have inputted the plateau dimensions
  When I input x and y coordinates and an orientation
  And I input an invalid command
  Then I should see "Invalid command"

Scenario: Cannot move rover outside grid
  Given I have inputted the plateau dimensions
  When I input x and y coordinates and an orientation
  And I try to move the rover outside the grid
  Then I should see "Cannot move rover outside plateau. Rover stopped at coordinates 1 5"
