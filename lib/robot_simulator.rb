require_relative 'table'
require_relative 'robot'

class RobotSimulator
  def initialize(table)
    @table = table
    @robot = Robot.new
  end

  def execute(command)
    return if command.strip.empty?

    input = command.split(/\s+/)
    command_operator = input.first
    args = input.last

    case command_operator
    when 'PLACE'
      place(args)
    when 'REPORT'
      report
    when 'MOVE'
      move
    when 'LEFT'
      left
    when 'RIGHT'
      right
    else
      "Invalid command: #{command_operator}"
    end
  end

  private

  def robot_on_table?
    @table.robot_placed? && @robot.facing_direction?
  end

  def place(placement)
    error = nil

    begin
      args = placement.split(/,/)
      x = args[0].to_i
      y = args[1].to_i
      facing = args[2].downcase.to_sym

      unless @robot.orientation(facing) && @table.place(x, y)
        error = 'Invalid arguments passed into PLACE.'
      end
    rescue
      error = 'No arguments passed into PLACE. Please provide the x, y co-ordinates and the direction'
    end
    error
  end

  def report
    return 'Robot must be placed first' unless robot_on_table?
    position = @table.position
    facing = @robot.direction
    "#{position[:x]},#{position[:y]},#{facing.to_s.upcase}"
  end

  def move
    return 'Robot must be placed first' unless robot_on_table?
    course = @robot.course
    position = @table.position
    x_pos = position[:x] + course[:x]
    y_pos = position[:y] + course[:y]
    if @table.place(x_pos, y_pos)
      nil
    else
      'Robot will fall off the table'
    end
  end

  def left
    return 'Robot must be placed first' unless robot_on_table?
    @robot.left
    nil
  end

  def right
    return 'Robot must be placed first' unless robot_on_table?
    @robot.right
    nil
  end
end
