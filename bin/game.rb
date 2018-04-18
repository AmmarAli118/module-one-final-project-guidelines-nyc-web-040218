require_relative '../config/environment'
require_all 'lib'

print "Type start to begin game or exit to leave:"
player_input = gets.chomp

if player_input.downcase == "start"
  continue = true
  print "Name your character:"
  player_character_name = gets.chomp
  player_character = Player.create(player_character_name)
  print "Your name is #{player_character_name}. "
  puts player_character.biography
  p player_character.room.description

  while continue == true
    puts "Type a commnand to move on or exit to leave (hint try 'help'):"
    player_command = gets.chomp

    if player_command.downcase == "exit"
      continue = false
      puts "Goodbye! Thanks for playing!"

    elsif player_command.downcase == "help"
      puts "Possible commands: look, move, pick up, inventory, use."

    elsif player_command.downcase == "look"
      p player_character.room.description

    elsif player_command.downcase == "move"
      p "In which direction would you like to move?"
      direction = gets.chomp
      player_character = player_character.move(direction) #the update method in .move saves the new value to the db, but does not update our player variable, so it must be updated as well.

    elsif player_command.downcase == "pick up"
      puts "What would you like to pick up?"
      string = gets.chomp
      player_character.pick_up(string)

    elsif player_command.downcase == "inventory"
      player_character.inventory
    elsif player_command.downcase == "use"
    end
  end

elsif player_input.downcase == "exit"
  puts "Goodbye! Thanks for playing!"
end
