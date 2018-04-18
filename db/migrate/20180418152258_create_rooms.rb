class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :description
      t.string :exits
      t.boolean :north
      t.boolean :east
      t.boolean :south
      t.boolean :west
      t.integer :level_id
    end
  end
end
