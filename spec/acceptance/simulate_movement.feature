# spec/acceptance/simulate_movement.feature

Feature: Simulating Movement
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
