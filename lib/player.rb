require 'pry'
class Player < ActiveRecord::Base
  has_many :levels
  has_many :items
  has_many :rooms, through: :items

  def self.create(name)
    super(name: name, health: 100, biography: "You are a young alchemist who is about graduate from The Flatcopper Alchemy bootcamp and today is your final test. \n To graduate you must find two halves of a broken key and use your alchemy skills to repair it.")
  end

  def inventory_objects
    Item.all.select {|item| item.in_inventory == true}
  end

  def inventory
    inventory_objects.map {|item| item.name}
  end

  def parse_item_str(item_str)
    Item.all.find {|item| item.name == item_str} #add location info to item table to && item.location == current_location
  end

  def pick_up(item_str)
    item_obj = parse_item_str(item_str)
    Item.update(item_obj.id, in_inventory: true)
    "Picked up #{item_str}."
  end

  def have?(item_obj)
    if inventory_objects.include?(item_obj)
      true
    else
      puts "You do not have that item!"
      false
    end
  end

  def use(item_str)
    item_obj = parse_item_str(item_str)
    if !have?(item_obj)
      nil
    elsif item_obj.category == "map"|| item_obj.category == "book"
      self.read(item_obj)
    # else

    end
  end
end
