require_relative '../config/environment.rb'
# require 'sinatra/activerecord/rake'
require_all 'lib'

def exit
  `rake db:rollback STEP=6`
  `rake db:migrate`
  `rake db:seed`
  puts "Goodbye! Thanks for playing!"
end

puts "Welcome to The Alchemist.\n\n"
print "Type start to begin game or exit to leave: "
player_input = gets.chomp

if player_input.downcase == "start"
  continue = true
  print "\nName your character: "
  player_character_name = gets.chomp
  player_character = Player.create(player_character_name)
  puts "Your name is #{player_character_name}."
  puts player_character.biography + "\n\n"
  puts player_character.room.description + "\n\n"

  while continue == true
    puts "Type a command to move on, or exit to leave (hint try 'help'):"
    player_command = gets.chomp

    if player_command.downcase == "exit"
      exit
      continue = false

    elsif player_command.downcase == "help"
      puts "\nPossible commands: look, move, pick up, inventory, use.\n\n"

    elsif player_command.downcase == "look"
      puts "\n" + player_character.room.description

    elsif player_command.downcase == "move"
      puts "\nIn which direction would you like to move?"
      direction = gets.chomp
      player_character = player_character.move(direction)
      ## Update room description when you pick up an item, so that it no longer says it is there.
      puts player_character.room.description

    elsif player_command.downcase == "pick up"
      puts "What would you like to pick up?"
      string = gets.chomp
      player_character.pick_up(string.downcase)

    elsif player_command.downcase == "inventory"
      player_character.inventory

    elsif player_command.downcase == "transmute"
      puts "What is your first item?"
      string1 = gets.chomp
      puts "\nWhat is your second item?"
      string2 = gets.chomp
      player_character.combine(string1, string2)

    elsif player_command.downcase == "use"
      puts "What item would you like to use?"
      user_item = gets.chomp
      player_character.use(user_item)
      
    else
      puts "Invalid command. Try 'help' if you are stuck."
    end

  end

elsif player_input.downcase == "exit"
  exit
end
