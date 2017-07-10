class CreateShips < ActiveRecord::Migration[5.1]
  def change
    create_table :ships do |t|
      t.integer :length
      t.boolean :sunk
      t.integer :board_id
      
      t.timestamps
    end
  end
end
