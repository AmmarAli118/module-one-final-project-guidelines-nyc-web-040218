class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :description
      t.integer :north
      t.integer :east
      t.integer :south
      t.integer :west
      t.integer :level_id
    end
  end
end
