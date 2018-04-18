class Room < ActiveRecord::Base
belongs_to :level
has_many :doors
has_many :items
end
