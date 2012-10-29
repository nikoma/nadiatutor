class Game < ActiveRecord::Base
  attr_accessible :correct, :points, :questions, :difficulty_id, :wrong
end
