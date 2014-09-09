# spec/acceptance/simulate_movement.feature

# Scenario #1:
# - PLACE 0,0,NORTH
# - MOVE
# - REPORT
# => 0,1,NORTH

Feature: Simulating Movement
  Background:
    Given there is a grid 5 by 5

  Scenario: Moving north
    Given a robot placed at (0,0) facing north
    When the robot moves
    Then the robot should be at (0,1) facing north