require 'pry'
class Player < ActiveRecord::Base
  has_many :levels
  has_many :items
  belongs_to :room

  def self.create(name)
    super(name: name, health: 100, biography: "You are a young alchemist who is about graduate from The Flatcopper Alchemy bootcamp and today is your final test. \n To graduate you must find two halves of a broken key and use your alchemy skills to repair it.", room_id: 1)
  end

  def inventory
    inv = inventory_objects.map {|item| item.name}
    if inv.empty?
      puts "Your inventory is empty!"
    else
      puts "You have: a #{inv.join(", a ")}"
    end
  end

  def move(str)
    cardinal = ["north", "south", "east", "west"]
    if cardinal.include?(str.downcase)
      if self.room[str.downcase.to_sym] != nil
        puts "You move #{str}."
        Player.update(1, :room_id => self.room[str.downcase.to_sym])
      else
        puts "You just walked into a wall. Ouch!"
        self
      end
    else
      puts "I pity the fool who thinks #{str} is a direction!"
      self
    end
  end

  def pick_up(item_str)
    item_obj = parse_item_str(item_str)
    item_obj = find_item_by_current_room(item_obj)
    if item_obj.nil?
      puts "You don't see one of those here."
    else
      Item.update(item_obj.id, in_inventory: true)
      puts "Picked up #{item_str}."
    end
  end

  def combine(str1, str2)
    item1 = parse_item_str(str1)
    item2 = parse_item_str(str2)
    if have?(item1) && have?(item2)
      if item1.category == item2.category && item1.category == "material component"
        new_item = Item.all.find {|item| item.category.include?(str1) && item.category.include?(str2)}
        puts "You made a #{new_item.name}!"
        Item.update(item1.id, in_inventory: false, room_id: nil)
        Item.update(item2.id, in_inventory: false, room_id: nil)
        Item.update(new_item.id, in_inventory: true)
      else
        puts "You can't transmute those components! Remember your training!"
      end
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

  private

  def parse_item_str(item_str)
    Item.all.find {|item| item.name == item_str}
  end

  def have?(item_obj)
    if inventory_objects.include?(item_obj)
      true
    else
      puts "You do not have #{item_obj.name}!"
      false
    end
  end

  def find_item_by_current_room(item_obj)
    Item.all.find {|item| item.room_id == self.room_id}
  end

  def inventory_objects
    Item.all.select {|item| item.in_inventory == true}
  end

end
