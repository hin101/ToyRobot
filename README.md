# ToyRobot
This application is a simulation of a toy robot.
## Installation
To begin, ensure you have [Git](https://git-scm.com/downloads) and [Ruby 2.3.4](https://www.ruby-lang.org/en/downloads/) installed, then run the following commands:
```
git clone git@github.com:hin101/ToyRobot.git
cd ToyRobot
gem install bundler
bundle install
```
## Executing The application
To run the robot simulator, run the following command:
```
ruby main.rb
```
### Customising The Table
By default, the table has a width of 5 and a height of 5, you can customise this by passing your desired height and width as parameters in initialisation of the table in the `main.rb` file:
```
# main.rb
...
# To specify a table of 4x4, initialise as Table.new(4, 4)
table = Table.new
```
## Running The Tests
To run the tests, run the following command:
```
rspec
```
## Notes
Rather then have one class do all the processing of commands, I have created the following classes:

* `main.rb` - This class is where the command is input and sent to the `RobotSimulator` class.
* `lib/robot_simulator.rb` - This class processes the commands and also initializes a new `Robot` and `Table` object.
* `lib/robot.rb` - The `Robot` class is where I handle the movement of the robot, the reason I choose to handle the movement here is to conform with the single responsibility principle.
* `lib/table.rb` - The `Table` class is where I map out the table and place the robot. Again, the reason why I handle this here is to conform with the sindle responsibility principle.
* Rubocop - I have, where possible, styled my code to conform with the Rubocop style guidelines.

Specification
=============

Description
-----------

- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.
- Create an application that can read in commands of the following forms -
```
  PLACE X,Y,F
  MOVE
  LEFT
  RIGHT
  REPORT
```
- `PLACE` will put the toy robot on the table in position `X`, `Y` and facing `NORTH`, `SOUTH`, `EAST` or `WEST`.
- The origin(0, 0) can be considered to be the `SOUTH WEST` most corner.
- The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command has been executed.
- `MOVE` will move the toy robot one unit forward in the direction it is currently facing.
- `LEFT` and `RIGHT` will rotate 90 degrees in the specified direction without changing the position of the robot.
- `REPORT` will announce the `X`, `Y` and `F`
- A robot that is not on the table can choose to the ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.
- Input can be from a file, or from standard input, ass the developer chooses.
- Provide test data to exercise the application.

Constraints
-----------

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot. Any move that would cause the robot to fall must be ignored.

Example Input and Output
------------------------

### a
```
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
```

### b
```
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```

### c
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```

Deliverables
------------

- The source files, the test data and any test code.
- It is not required to provide any graphical output showing the movement of the toy robot.
