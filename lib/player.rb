class Player < ActiveRecord::Base
has_many :levels
has_one :inventory

  def inv
    Inventory.all.first
  end

  def inventory
    inv.check
  end

  def pick_up(item_obj)
    inv.pick_up(item_obj)
  end

  def have?(item_obj)
    if inventory.include?(item_obj)
      true
    end
    puts "You do not have this item!"
    break
  end

  def use(item_obj)
    have?(item_obj)
    if item_obj.category == "map"|| item_obj.category == "book"
      self.read(item_obj)
    else
      
    end
  end
end
