level = Level.create(name: "Forest Temple", player_id: 1) #player_id: player.id also works

room1 = Room.create(description: "You are in a small stone brick room lit with two torches. There's nothing of interest here\nexcept a door to the south. And a book, alchemy for dummies, but you've already read that one.", north: nil, east: nil, south: 2, west: nil, level: level)

room2 = Room.create(description: "This room looks the same as the last room but with doors to the north, south, east and west.\nThe southern door has a big lock on it. And is that a tribble on the floor?", north: 1, east: 4, south: 5, west: 3, level: level)

room3 = Room.create(description: "This room has a small window. As you look up at it you catch a glimpse of a face\nducking out of view. On the floor is a broken key shaft.", north: nil, east: 2, south: nil, west: nil, level: level)

room4 = Room.create(description: "This room has a window too. 'Of course there's a window.' you think to yourself. The instructors\nwould want to watch you run through the test. As you look at the floor you see a broken key.", north: nil, east: nil, south: nil, west: 2, level: level)

room5 = Room.create(description: "Finally, you've made it to the end of the test.\nOn a table in front of you sits your diploma.", north: 2, east: nil, south: nil, west: nil, level: level)

door1 = Door.create(is_open: false, room_id: 2)

book = Item.create(name: "alchemy for dummies", category: "gag item", in_inventory: false, room: room1, player_id: 1)
tribble = Item.create(name: "tribble", category: "gag item", in_inventory: false, room: room2, player_id: 1)

key_half_one = Item.create(name: "broken key shaft", category: "material component", in_inventory: false, room: room3, player_id: 1)
key_half_two = Item.create(name: "broken key", category: "material component", in_inventory: false, room: room4, player_id: 1)
whole_key = Item.create(name: "key", category: "#{key_half_one.name} #{key_half_two.name}", in_inventory: false, room_id: nil, player_id: 1)
