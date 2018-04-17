class CreateEnemy < ActiveRecord::Migration[5.2]
  def change
    create_table :enemies do |t|
      t.string :name
      
    end
  end
end
