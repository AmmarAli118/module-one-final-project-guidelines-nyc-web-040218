level = Level.create(name: "Forest Temple", player_id: 1) #player_id: player.id also works

room1 = Room.create(description: "Small stone brick room lit with two torches. There's nothing of interest here except a door to the south.", north: nil, east: nil, south: 2, west: nil, level: level)
room2 = Room.create(description: "This room looks the same as the last room but with doors to the north, south, east and west. And is that a... sledgehammer on the floor?", north: 1, east: 4, south: 5, west: 3, level: level)

# player = Player.create(name: "Carl")

map = Item.create(name: "Map", category: "Map", in_inventory: false, room: room1, player_id: 1)
rock = Item.create(name: "Rock", category: "Item", in_inventory: false, room: room2, player_id: 1)
