class Player < ActiveRecord::Base
  has_many :levels
  has_one :inventory
end
