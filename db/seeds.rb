player = Player.create(name: "Carl", health: 100, biography: "A young pumpkin.")

level1 = Level.create(name: "Forest Temple", player: player)

inv = Inventory.create()

map = Item.create(name: "Map", category: "Map", in_inventory: false, level_id: level1, inventory_id: inv)
