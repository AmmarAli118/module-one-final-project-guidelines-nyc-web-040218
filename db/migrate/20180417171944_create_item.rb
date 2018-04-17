class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.boolean :in_inventory
      t.integer :level_id
      t.integer :inventory_id
    end
  end
end
