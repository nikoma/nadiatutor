class Question < ActiveRecord::Base
  attr_accessible :correct_result, :game_id, :number_a, :number_b, :your_result, :user_id
end
