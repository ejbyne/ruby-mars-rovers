Feature: Starting the application
  As a NASA mission controller
  I want to have a text input interface
  So I can control the Mars Rovers

Scenario: Page title
  Given I am on the start page
  Then I should see "NASA Mars Mission Control Terminal"

Scenario: Ready to specify plateau dimensions
  Given I am on the start page
  Then I should see "Please enter the upper-right coordinates of the plateau"
