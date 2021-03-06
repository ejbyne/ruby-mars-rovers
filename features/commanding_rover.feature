Feature: Moving a rover
  As a NASA mission controller
  I want to input text commands
  So I can move a rover within the plateau

  Scenario: Selecting a rover
    Given I input the plateau dimensions
    When I input the position of a rover
    Then I should see "Rover selected in position 1 2 N"

  Scenario: Moving a rover
    Given I input the plateau dimensions
    And I input the position of a rover
    When I input a command for that rover
    Then I should see "Rover moved to position 1 3 N"
