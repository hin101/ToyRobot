require_relative 'lib/robot_simulator'

robotSimulator = RobotSimulator.new

puts 'Enter a command or type EXIT to quit:'

command = gets.chomp
while command !~ /EXIT/i
  output = robotSimulator.execute(command)
  puts output if output
  command = gets.chomp
end
