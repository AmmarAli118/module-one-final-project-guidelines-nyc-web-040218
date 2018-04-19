require_relative '../config/environment.rb'
require_all 'lib'

def exit
  `rake db:rollback STEP=6`
  `rake db:migrate`
  `rake db:seed`
  puts "Goodbye! Thanks for playing!"
end
#
# prompt = TTY::Prompt.new
# font = TTY::Font.new(:doom)
# pastel = Pastel.new
#
# puts "\n"
# puts pastel.bright_white.bold(font.write("THE       ALCHEMIST"))
# puts "\n"
#

# prompt = TTY::Prompt.new
# prompt.ask("Type start to begin game or exit to leave:", default: ENV['exit'])
# puts "\n"
# prompt.ask("Name your character:")
# puts "\n"

#
# prompt.select("What do you do?", %w(Look Move Pick\ up Inventory Transmute Help))

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
      puts "\nPossible commands: look, move, pick up, unlock, inventory and transmute.\n\n"

    elsif player_command.downcase == "look"
      puts player_character.room.description

    elsif player_command.downcase == "move"
      puts "\nIn which direction would you like to move?"
      direction = gets.chomp
      player_character = player_character.move(direction)
      ## Update room description when you pick up an item, so that it no longer says it is there.
      puts player_character.room.description

    elsif player_command.downcase == "pick up"
      puts "What would you like to pick up?"
      string = gets.chomp
      if string.downcase == "diploma"
        puts "You have successfully passed your test! You win!"
        continue = false
        exit
      else
        player_character.pick_up(string.downcase)
      end

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

    elsif player_command.downcase == "unlock"
      player_character.unlock_door
    else
      puts "Invalid command. Try 'help' if you are stuck."
    end

  end

elsif player_input.downcase == "exit"
  exit
end
