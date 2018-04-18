level = Level.create(name: "Forest Temple", player_id: 1) #player_id: player.id also works

room1 = Room.create(description: "A room!", exits: "North", north: true, east: false, south: false, west: true, level: level)
room2 = Room.create(description: "Another room!", exits: "South, East", north: false, east: true, south: true, west: true, level: level)

player = Player.create(name: "Carl")

map = Item.create(name: "Map", category: "Map", in_inventory: false, room: room1, player_id: 1)
rock = Item.create(name: "Rock", category: "Item", in_inventory: false, room: room2, player_id: 1)
