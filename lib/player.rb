require 'pry'
class Player < ActiveRecord::Base
  has_many :levels
  has_many :items
  belongs_to :room

  def self.create(name)
    super(name: name, health: 100, biography: "You are a young alchemist who is about graduate from The Flatcopper Alchemy bootcamp and today is your final test. \n To graduate you must find two halves of a broken key and use your alchemy skills to repair it.", room_id: 1)
  end

  def inventory_objects
    Item.all.select {|item| item.in_inventory == true}
  end

  def inventory
    inv = inventory_objects.map {|item| item.name}
    if inv.empty?
      p "Your inventory is empty!"
    else
      p "You have: a #{inv.join(", ")}"
    end
  end

  def parse_item_str(item_str)
    Item.all.find {|item| item.name == item_str && item.room_id == self.room_id}
  end

  def move(str)
    cardinal = ["north", "south", "east", "west"]
    if cardinal.include?(str.downcase)
      if self.room[str.downcase.to_sym] != nil
        Player.update(1, :room_id => self.room[str.downcase.to_sym])
      else
        "You just walked into a wall. Ouch!"
      end
    else
      p "I pity the fool who thinks #{str} is a direction!"
    end
  end


  def pick_up(item_str)
    item_obj = parse_item_str(item_str)
    if item_obj == nil
      p "You don't see one of those."
    else
      Item.update(item_obj.id, in_inventory: true)
      p "Picked up #{item_str}."
    end
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
