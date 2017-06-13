require_relative 'table'
require_relative 'robot'

class RobotSimulator
  def initialize
    @table = Table.new
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
      puts 'move'
    when 'LEFT'
      puts 'left'
    when 'RIGHT'
      puts 'right'
    else
      puts "Invalid command: #{command_operator}"
    end
  end

  private

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
      error = 'Invalid arguments passed into PLACE.'
    end
    error
  end

  def report
    return 'Robot must be placed first' unless @table.robot_placed?
    position = @table.position
    facing = @robot.direction
    "#{position[:x]},#{position[:y]},#{facing.to_s.upcase}"
  end
end
