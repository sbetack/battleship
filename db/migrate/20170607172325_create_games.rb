class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.integer :player_count
      
      t.timestamps
    end
  end
end
