require_relative '../config/environment'
require_all 'lib'

print "Type start to begin game or exit to leave:"
player_input = gets.chomp

if player_input.downcase == "start"
  continue = true
  print "Name your character:"
  player_character_name = gets.chomp
  player_character = Player.create(player_character_name)
  p player_character.biography
  while continue == true
    p "Type a commnand to move on or exit to leave (hint try 'help'):"
    player_command = gets.chomp
    if player_command.downcase == "exit"
      continue = false
      puts "Goodbye! Thanks for playing!"
    elsif player_command.downcase == "help"
      puts "Possible commands: look, move, pick up, inventory, use."
    elsif player_command.downcase == "look"

    elsif player_command.downcase == "move"

    elsif player_command.downcase == "pick up"

    elsif player_command.downcase == "inventory"

    elsif player_command.downcase == "use"
    end
  end

elsif player_input.downcase == "exit"
  puts "Goodbye! Thanks for playing!"
end
