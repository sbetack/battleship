class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.integer :board_id
      t.integer :ship_id
      t.string :status
      t.string :coordinate

      t.timestamps
    end
  end
end
