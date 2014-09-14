# spec/acceptance/simulate_commands.feature

# Please note that 'Rubbot' is the app name and should not be mixed with Robot

Feature: Simulating Commands
  Background:
    Given there is a grid 5 by 5

  Scenario: Placement command
    When rubbot is setup
    And the input is "PLACE 0,0,NORTH"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "0,0,NORTH"

  Scenario: Move command
    When rubbot is setup
    And the input is "PLACE 0,0,NORTH"
    And the input is "MOVE"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "0,1,NORTH"
