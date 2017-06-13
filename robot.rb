
puts 'Enter a command or type EXIT to quit:'
command = gets.chomp
 
while command !~ /EXIT/i
  puts command
  command = gets.chomp
end
