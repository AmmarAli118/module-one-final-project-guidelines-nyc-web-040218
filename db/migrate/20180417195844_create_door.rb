class CreateDoor < ActiveRecord::Migration[5.2]
  def change
    create_table :doors do |t|
      t.boolean :is_open
      t.integer :room_id
    end
  end
end
