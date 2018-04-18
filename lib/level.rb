class Level < ActiveRecord::Base
  belongs_to :player
  has_many :rooms
  has_many :items, through: :rooms
  has_many :doors
  has_many :enemies
end
