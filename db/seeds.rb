level = Level.create(name: "Forest Temple", player_id: 1) #player_id: player.id also works

room1 = Room.create(description: "You are in a small stone brick room lit with two torches. There's nothing of interest here except a door to the south.", north: nil, east: nil, south: 2, west: nil, level: level)

room2 = Room.create(description: "This room looks the same as the last room but with doors to the north, south, east and west. And is that a... sledgehammer on the floor?", north: 1, east: 4, south: 5, west: 3, level: level)

room3 = Room.create(description: "This room has a small window. As you look up at it you catch a glimpse of a face ducking out of view. On the floor is half of a key.", north: nil, east: 2, south: nil, west: nil, level: level)

room4 = Room.create(description: "This room has a window too. 'Of course there's a window.' you think to yourself. 'The instructors would want to watch you run through the test.' As you look at the floor you see half of a key.", north: nil, east: nil, south: nil, west: 2, level: level)

room5 = Room.create(description: "Finally, you've made it to the end of the test. On a table in front of you sits your diploma.", north: 2, east: nil, south: nil, west: nil, level: level)

# player = Player.create(name: "Carl")

map = Item.create(name: "map", category: "map", in_inventory: false, room: room1, player_id: 1)
sledge = Item.create(name: "sledgehammer", category: "item", in_inventory: false, room: room2, player_id: 1)

key_half_one = Item.create(name: "broken key1", category: "material component", in_inventory: true, room: room3, player_id: 1)
key_half_two = Item.create(name: "broken key2", category: "material component", in_inventory: true, room: room4, player_id: 1)
whole_key = Item.create(name: "key", category: "#{key_half_one.name} #{key_half_two.name}", in_inventory: false, room_id: nil, player_id: 1)
