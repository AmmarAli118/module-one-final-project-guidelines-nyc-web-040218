class Player < ActiveRecord::Base
  has_many :levels
  has_one :inventory

  def self.create(name)
    char = super(name: name, health: 100, biography: "You are a young alchemist who is about graduate from The Flatcopper Alchemy bootcamp and today is your final test. \n To graduate you must find two halves of a broken key and use your alchemy skills to repair it.")
  end

  def inventory_objects
    Item.all.select {|item| item.in_inventory == true}
  end

  def inventory
    inventory_objects.map {|item| item.name}
  end

  def pick_up(item_obj)
    Item.update(item.id, in_inventory: true)
    "Picked up #{item_obj}."
  end

  def have?(item_obj)
    if inventory.include?(item_obj)
      true
    else
      puts "You do not have that item!"
      false
    end
  end

  def use(item_obj)
    if !have?(item_obj)
      nil
    elsif item_obj.category == "map"|| item_obj.category == "book"
      self.read(item_obj)
    # else

    end
  end
end
