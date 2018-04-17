class Level < ActiveRecord::Base
  belongs_to :player
  has_many :items
  has_many :doors
  has_many :enemies
end
