require_relative '../config/environment.rb'
require_all 'lib'

def exit
  `rake db:rollback STEP=6`
  puts "\nGoodbye! Thanks for playing!"
end

prompt = TTY::Prompt.new
font = TTY::Font.new(:doom)
pastel = Pastel.new

puts "\n"
puts pastel.bright_white.bold(font.write("   THE       ALCHEMIST"))
puts "\n"

`rake db:migrate`
`rake db:seed`


continue = true
print "\nName your character: "
player_character_name = gets.strip
player_character = Player.create(player_character_name)
puts "\n"
puts "Your name is #{player_character_name}."
puts "\n"
puts player_character.biography
puts "\n"
puts player_character.room.description

while continue == true
  puts "\nType a command to move on, or exit to leave (hint try 'help'):"
  player_command = gets.strip

  if player_command.downcase == "exit"
    exit
    continue = false

  elsif player_command.downcase == "help"
    puts "\nPossible commands: look, move, pick up, map, inventory, unlock, destroy and transmute."

  elsif player_command.downcase == "map"
    puts "\n
                         ________________________                \n
                        |                        |               \n
                        |        Room 1          |               \n
                        |                        |               \n
          ______________|_________      _________|______________ \n
         |              |                        |              |\n
         |    Room 3              Room 2             Room 4     |\n
         |              |                        |              |\n
         |______________|___________==___________|______________|\n
                        |                        |               \n
                        |        Room 5          |               \n
                        |                        |               \n
                        |________________________|               \n"
    puts "\n"
    puts "You are in room #{player_character.room_id}."

  elsif player_command.downcase == "look"
    puts "\n"
    puts player_character.room.description

  elsif player_command.downcase == "move"
    puts "\nIn which direction would you like to move?"
    direction = gets.strip
    puts "\n"
    player_character = player_character.move(direction)
    puts "\n"
    puts player_character.room.description

  elsif player_command.downcase == "pick up"
    puts "\nWhat would you like to pick up?"
    string = gets.strip
    if string.downcase == "diploma"
      puts "\nYou have successfully passed your test! You win!"
      continue = false
      exit
    else
      puts "\n"
      player_character.pick_up(string.downcase)
    end

  elsif player_command.downcase == "inventory"
    puts "\n"
    player_character.inventory

  elsif player_command.downcase == "transmute"
    if player_character.inventory
    else
      puts "What is your first item?"
      string1 = gets.strip
      puts "\nWhat is your second item?"
      string2 = gets.strip
      puts "\n"
      player_character.combine(string1, string2)
    end

  elsif player_command.downcase == "destroy"
    if player_character.inventory
    else
      puts "\nWhat item would you like to destroy?"
      user_item = gets.strip
      puts "\n"
      player_character.destroy(user_item)
    end

  elsif player_command.downcase == "unlock"
    puts "\n"
    player_character.unlock_door
  else
    puts "\nInvalid command. Try 'help' if you are stuck."
  end

end
