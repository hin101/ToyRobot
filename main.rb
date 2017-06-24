require_relative 'lib/robot_simulator'
require_relative 'lib/table'

table = Table.new
robot_simulator = RobotSimulator.new(table)

puts 'Enter a command or type EXIT to quit:'

command = gets.chomp
while command !~ /EXIT/
  output = robot_simulator.execute(command)
  puts output if output
  command = gets.chomp
end
