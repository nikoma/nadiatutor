class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :number_a
      t.integer :number_b
      t.integer :correct_result
      t.integer :your_result
      t.integer :game_id

      t.timestamps
    end
  end
end
