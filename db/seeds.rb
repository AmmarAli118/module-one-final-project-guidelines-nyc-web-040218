player = Player.create(name: "Carl", health: 100, biography: "A young pumpkin.")

level1 = Level.create(name: "Forest Temple", player: player) #player_id: player.id also works

inv = Inventory.create()

map = Item.create(name: "Map", category: "Map", in_inventory: false, level: level1, inventory: inv)
