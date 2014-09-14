Rubbot
======

[![Gem Version](https://badge.fury.io/rb/rubbot.svg)](http://badge.fury.io/rb/rubbot)
[![Code Climate](https://codeclimate.com/github/dzotokan/rubbot/badges/gpa.svg)](https://codeclimate.com/github/dzotokan/rubbot)
[![Dependency Status](https://gemnasium.com/dzotokan/rubbot.svg)](https://gemnasium.com/dzotokan/rubbot)


Toy Robot simulation implementation in Ruby.

## Usage

### Gem

  ``` bash
  $ gem install rubbot
  $ rubbot
  ```

### Simple

  ``` bash
  $ ruby -Ilib ./bin/rubbot
  ```
  
### Manual

  ``` bash
  $ gem install rubbot
  ```

  ``` ruby
  # Load the library
  require 'rubbot'
  
  # Create a new grid
  grid = Grid.new(5, 5)
  
  # Start the app
  rubbot = Rubbot.new(grid)
  rubbot.start
  ```
  
## Tests
### All
  ```bash
  $ rspec spec
  ```
### Specific
  ```bash
  $ rspec spec/lib/robot_spec.rb
  $ rspec spec/acceptance/simulate_roaming.feature
  ```

## Specification

### Description
  - The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
  - There are no other obstructions on the table surface.
  - The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.


#### Input

The application should be able to read in commands of the following form: `PLACE X,Y,F`, `MOVE`, `LEFT`, `RIGHT`, `REPORT`

#### Commands

The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command. The application should discard all commands in the sequence until a valid `PLACE` command has been executed. The origin (`0,0`) can be considered to be the `SOUTH WEST` most corner.

##### Place
  `PLACE` will put the toy robot on the table in position `X,Y` and facing `NORTH`, `SOUTH`, `EAST` or `WEST`.

##### Move
  `MOVE` will move the toy robot one unit forward in the direction it is currently facing.

##### Left & Right
  `LEFT` and `RIGHT` will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
  
##### Report
  `REPORT` will announce the `X`,`Y` and `F` of the robot. This can be in any form, but standard output is sufficient.

#### Other
- A robot that is not on the table can choose to ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.
- Input can be from a file or from standard input.
- Test data to exercise the application should be provided.

### Constraints
The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

#### Example Input and Output:

##### Scenario #1
```
PLACE 0,0,NORTH
MOVE
REPORT

# => 0,1,NORTH
```

##### Scenario #2
```
PLACE 0,0,NORTH
LEFT
REPORT

# => 0,0,WEST
```

##### Scenario #3
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT

# => 3,3,NORTH
```

## License

Rubbot is under the [MIT License](http://www.opensource.org/licenses/MIT).
