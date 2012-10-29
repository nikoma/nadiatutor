class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :questions
      t.integer :correct
      t.integer :wrong
      t.integer :points
      t.integer :range_id

      t.timestamps
    end
    add_index :games, :range_id
  end
end
