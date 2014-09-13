# spec/acceptance/simulate_roaming.feature

Feature: Simulating Roaming (Movement & Rotation)
  Background:
    Given there is a grid 5 by 5

  # Placed at the most South-East
  Scenario: Moving north
    Given a robot placed at (0,0) facing north
    When the robot moves
    Then the robot should be at (0,1) facing north

  Scenario: Moving east
    Given a robot placed at (0,0) facing east
    When the robot moves
    Then the robot should be at (1,0) facing east

  # Placed at the centre
  Scenario: Moving south
    Given a robot placed at (2,2) facing south
    When the robot moves
    Then the robot should be at (2,1) facing south

  Scenario: Moving west
    Given a robot placed at (2,2) facing west
    When the robot moves
    Then the robot should be at (1,2) facing west

  Scenario: Invalid move
    Given a robot placed at (0,0) facing south
    When the robot moves
    Then the robot should be at (0,0) facing south

  # Rotations
  Scenario: Turning left
    Given a robot placed at (2,2) facing north
    When the robot turns left
    Then the robot should be at (2,2) facing west

  Scenario: Turning left x2
    Given a robot placed at (2,2) facing north
    When the robot turns left
    And the robot turns left
    Then the robot should be at (2,2) facing south

  Scenario: Turning right
    Given a robot placed at (2,2) facing north
    When the robot turns right
    Then the robot should be at (2,2) facing east

  Scenario: Turning right x2
    Given a robot placed at (2,2) facing north
    When the robot turns right
    And the robot turns right
    Then the robot should be at (2,2) facing south

  Scenario: Turning left & right
    Given a robot placed at (2,2) facing north
    When the robot turns left
    Then the robot should be at (2,2) facing west
    And the robot turns right
    Then the robot should be at (2,2) facing north

  Scenario: Turning right & left
    Given a robot placed at (2,2) facing north
    When the robot turns right
    Then the robot should be at (2,2) facing east
    And the robot turns left
    Then the robot should be at (2,2) facing north

  # Combination of moving and turning
  Scenario: Moving & Turning
    Given a robot placed at (2,2) facing north
    When the robot turns right
    And the robot moves
    And the robot turns right
    And the robot moves
    And the robot moves
    And the robot turns left
    Then the robot should be at (3,0) facing east