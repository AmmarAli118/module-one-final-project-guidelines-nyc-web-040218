class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.boolean :in_inventory
      t.integer :room_id
      t.integer :player_id
    end
  end
end
