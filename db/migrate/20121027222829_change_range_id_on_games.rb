class ChangeRangeIdOnGames < ActiveRecord::Migration
  def up
    rename_column :games, :range_id, :difficulty_id
  end

  def down
  end
end
