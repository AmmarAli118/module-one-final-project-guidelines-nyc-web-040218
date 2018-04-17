class Item < ActiveRecord::Base
  belongs_to :level
  belongs_to :inventory
end
