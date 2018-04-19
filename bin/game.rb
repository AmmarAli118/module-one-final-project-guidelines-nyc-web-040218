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
puts pastel.bright_white.bold(font.write("THE       ALCHEMIST"))
puts "\n"

`rake db:migrate`
`rake db:seed`


# prompt = TTY::Prompt.new
# prompt.ask("Type start to begin game or exit to leave:", default: ENV['exit'])
# puts "\n"
# prompt.ask("Name your character:")
# puts "\n"

#
# prompt.select("What do you do?", %w(Look Move Pick\ up Inventory Transmute Help))

# puts "Welcome to The Alchemist.\n\n"
print "Type start to begin game or exit to leave: "
player_input = gets.strip

  if player_input.downcase != "start" && player_input.downcase != "exit"
    print "Type start to begin game or exit to leave: "
    player_input = gets.strip
  elsif player_input.downcase == "start"
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
    player_command = gets.chomp

    if player_command.downcase == "exit"
      exit
      continue = false

    elsif player_command.downcase == "help"
      puts "\nPossible commands: look, move, pick up, map, inventory, unlock, destroy and transmute."

    elsif player_command.downcase == "map"
      puts "                           ________________________                \n
                          |                        |               \n
                          |        Room 1          |               \n
                          |                        |               \n
            ______________|_________      _________|______________ \n
           |              |                        |              |\n
           |    Room 3              Room 2             Room 4     |\n
           |              |                        |              |\n
           |______________|___________++___________|______________|\n
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
      direction = gets.chomp
      puts "\n"
      player_character = player_character.move(direction)
      ## Update room description when you pick up an item, so that it no longer says it is there.
      puts "\n"
      puts player_character.room.description

    elsif player_command.downcase == "pick up"
      puts "\nWhat would you like to pick up?"
      string = gets.chomp
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
      puts "\nWhat is your first item?"
      string1 = gets.chomp
      puts "\nWhat is your second item?"
      string2 = gets.chomp
      puts "\n"
      player_character.combine(string1, string2)

    elsif player_command.downcase == "destroy"
      puts "\nWhat item would you like to destroy?"
      user_item = gets.chomp
      puts "\n"
      player_character.destroy(user_item)

    elsif player_command.downcase == "unlock"
      puts "\n"
      player_character.unlock_door
    else
      puts "\nInvalid command. Try 'help' if you are stuck."
    end

  end

elsif player_input.downcase == "exit"
  exit
end
