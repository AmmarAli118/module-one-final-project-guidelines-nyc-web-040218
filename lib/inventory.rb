class Inventory < ActiveRecord::Base
has_many :items

def pick_up(item)
  Item.update(item.id, in_inventory: true)
  "Picked up #{item}."
end

def check
  Item.all.select {|item| item.in_inventory == true}
end
end
