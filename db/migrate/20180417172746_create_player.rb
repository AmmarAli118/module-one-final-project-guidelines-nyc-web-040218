class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.text :biography
      t.integer :room_id
    end
  end
end
