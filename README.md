# Mars Rovers (Ruby)

## Summary

This is an application built to control a squad of robotic rovers to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth. A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

## Technologies used

- Ruby
- Sinatra
- RSpec
- Capybara
- Cucumber

## Features

- In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.
- The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.
- The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.
- The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.
- Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.
- An error is raised if the grid coordinates, rover position or movement command is invalid
- A rover may not be placed or move outside of the plateau grid
- A rover may not move onto a cell occupied by another rover
- The browser interface contains a visual representation of the plateau grid, including showing the location and direction of any rovers within the grid

## Assumptions

I have made the following assumptions:
- Each cell within the grid is only big enough to hold one rover and a rover cannot move onto a cell occupied by another.
- A rover is incapable of moving off the grid.
- A rover will stop once it has either completed its commands, or is blocked by another rover, or has reached the edge of the grid.

## Instructions

### Installation

Once you have copied this directory onto your machine, please change into that directory and install the application's dependencies:
```
$ cd mars-rovers
$ bundle install
```

### Run the application

Start the server:
```
$ rackup
```
Visit [http://localhost:9292](http://localhost:9292) in your browser.

### Run the test suite

Acceptance tests:
```
$ cucumber
```

Unit tests:
```
$ rspec
```
