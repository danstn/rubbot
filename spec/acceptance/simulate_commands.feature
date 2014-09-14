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

  Scenario: Invalid placement
    When rubbot is setup
    And the input is "PLACE -1,7,NORTH"
    And the input is "REPORT"
    And rubbot is started
    Then notice is displayed

  Scenario: Invalid placements
    When rubbot is setup
    And the input is "PLACE 8,10,EAST"
    And the input is "PLACE -2,-4,EAST"
    And the input is "PLACE 2,2,NORTH"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "2,2,NORTH"

  Scenario: Teleport
    When rubbot is setup
    And the input is "PLACE 0,0,EAST"
    And the input is "PLACE 0,4,NORTH"
    And the input is "PLACE 4,4,WEST"
    And the input is "PLACE 0,4,SOUTH"
    And the input is "PLACE 2,2,NORTH"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "2,2,NORTH"

  Scenario: Move command
    When rubbot is setup
    And the input is "PLACE 0,0,NORTH"
    And the input is "MOVE"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "0,1,NORTH"

  Scenario: Invalid movement
    When rubbot is setup
    And the input is "PLACE 0,0,WEST"
    And the input is "MOVE"
    And the input is "MOVE"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "0,0,WEST"

  Scenario: Left command
    When rubbot is setup
    And the input is "PLACE 0,0,NORTH"
    And the input is "LEFT"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "0,0,WEST"

  Scenario: Right command
    When rubbot is setup
    And the input is "PLACE 0,0,NORTH"
    And the input is "RIGHT"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "0,0,EAST"

  Scenario: Rotate and Move commands
    When rubbot is setup
    And the input is "PLACE 0,0,NORTH"
    And the input is "RIGHT"
    And the input is "MOVE"
    And the input is "MOVE"
    And the input is "LEFT"
    And the input is "MOVE"
    And the input is "RIGHT"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "2,1,EAST"

  Scenario: Rotate and Move commands
    When rubbot is setup
    And the input is "PLACE 1,2,EAST"
    And the input is "MOVE"
    And the input is "MOVE"
    And the input is "LEFT"
    And the input is "MOVE"
    And the input is "REPORT"
    And rubbot is started
    Then the output is "3,3,NORTH"
