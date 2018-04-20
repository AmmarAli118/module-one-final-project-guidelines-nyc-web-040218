# The Alchemist - A Text Adventure CLI
The Alchemist is a text adventure game based on the earliest CLI games and is currently in it's most basic working state. We, the creators, are planning to implement more functionality and build out the game over time, so take this as a proof of concept.

## How to play
Upon running the game with `ruby bin/run.rb` from the top of the file structure, the title will print and you will be prompted to enter a character name.

From this point on, you can type 'help' for a list of commands at nearly any time, unless you are in a command already.
These commands are: look, move, pick up, map, inventory, unlock, destroy and transmute.

- look: puts out a description of the player's current room, which updates after picking up items.
- move: allows you to enter a direction in which to move.
- pick up: allows you to enter an item to pick up, provided it is in the current room.
- map: displays a map and lets you know what room you are in.
- inventory: puts out your current items.
- unlock: unlocks a locked door, provided you have a key.
- destroy: destroys any non-essential item.
- transmute: allows the alchemist to combine two material components!

## Future functionality
We are hoping to add several features to this game, time permitting:

- enemies
- destructible and transmutable obstacles
- more levels
- puzzles
- spell books (hidden commands)

## Contributors
Lane Miller - LaneMiller on GitHub
Daniel Brazel - ahkian on GitHub

## License
spec.license = 'MIT'
