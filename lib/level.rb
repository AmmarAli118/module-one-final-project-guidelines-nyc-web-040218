class Level < ActiveRecord::Base
  belongs_to :player
<<<<<<< HEAD
  has_many :rooms
  has_many :items, through: :rooms
  has_many :doors
=======
  has_many :items
  has_many :rooms
>>>>>>> 192c5bdad6e46cdd5c5ccb4bbd24df44dbac87eb
  has_many :enemies
end
