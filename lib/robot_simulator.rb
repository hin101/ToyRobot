class RobotSimulator
  def execute(command)
    return if command.strip.empty?

    input = command.split(/\s+/)
    command_operator = input.first
    command_args = input.last

    case command_operator
      when 'PLACE'
        puts 'place'
      when 'REPORT'
        puts 'report'
      when 'MOVE'
        puts 'move'
      when 'LEFT'
        puts 'left'
      when 'RIGHT'
        puts 'right'
      else
        puts "Invalid command: #{command_operator}, valid commands are: PLACE REPORT MOVE LEFT RIGHT"
    end
  end
end
