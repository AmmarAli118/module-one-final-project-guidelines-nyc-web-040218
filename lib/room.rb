class Room < ActiveRecord::Base
belongs_to :level
has_many :doors
has_many :items
has_one :player

def current_room?
  self.level
end
end
